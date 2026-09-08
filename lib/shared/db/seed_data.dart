import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'business_database.dart';
import 'core_database.dart';

const _uuid = Uuid();

/// Populates a fresh install with the four businesses, users and
/// representative records shown in the mock design (Main Office / City
/// Café / Riverside Café / Corporate Trading Unit), so the app is
/// reviewable immediately instead of opening to an empty shell.
///
/// Idempotent: no-ops if `businesses` already has rows.
Future<void> seedIfEmpty(CoreDatabase core, BusinessDatabase Function(String) openBusinessDb) async {
  final existing = await core.select(core.businesses).get();
  if (existing.isNotEmpty) return;

  final now = DateTime.now();

  final mainOfficeId = _uuid.v4();
  final cityCafeId = _uuid.v4();
  final riversideId = _uuid.v4();
  final corpTradingId = _uuid.v4();

  final businessSeeds = [
    (mainOfficeId, 'Main Office', 'Service & Administration', 'Kochi, Kerala, India', true, 'biz_main_office.db'),
    (cityCafeId, 'City Café', 'Food & Beverage', 'Kochi, Kerala, India', false, 'biz_city_cafe.db'),
    (riversideId, 'Riverside Café', 'Food & Beverage', 'Aluva, Kerala, India', false, 'biz_riverside_cafe.db'),
    (corpTradingId, 'Corporate Trading Unit', 'Trading', 'Kochi, Kerala, India', false, 'biz_corp_trading.db'),
  ];

  await core.batch((b) {
    for (final (id, name, type, location, isHead, dbFile) in businessSeeds) {
      b.insert(
        core.businesses,
        BusinessesCompanion.insert(
          id: id,
          name: name,
          businessType: type,
          location: location,
          isHeadOffice: Value(isHead),
          dbFilename: dbFile,
          fiscalYearLabel: '2024-2025',
          createdAt: now,
          lastActivityAt: now,
        ),
      );
    }
  });

  // Roles (fixed lookup matching the Permissions Matrix screen).
  const roleNames = ['Administrator', 'Director', 'Manager', 'Accountant', 'Staff'];
  final roleIds = <String, String>{for (final r in roleNames) r: _uuid.v4()};
  await core.batch((b) {
    for (final name in roleNames) {
      b.insert(core.roles, RolesCompanion.insert(id: roleIds[name]!, name: name));
    }
    const modules = ['Finance', 'Payroll', 'Assets', 'Inventory', 'Reports', 'Administration'];
    const fullAccessRoles = ['Administrator', 'Director', 'Manager', 'Accountant'];
    for (final module in modules) {
      for (final role in roleNames) {
        final access = role == 'Staff'
            ? (module == 'Administration' ? 'none' : 'view_limited')
            : (fullAccessRoles.contains(role) ? 'full' : 'view_limited');
        b.insert(
          core.permissionsMatrix,
          PermissionsMatrixCompanion.insert(id: _uuid.v4(), roleId: roleIds[role]!, module: module, access: access),
        );
      }
    }
  });

  // Users, matching the Security & Admin > Users & Roles table.
  final userSeeds = [
    ('admin', 'John Mathew', 'Administrator', mainOfficeId, 'Full Access'),
    ('director', 'Anitha Menon', 'Director', mainOfficeId, 'High Access'),
    ('manager1', 'Ravi Kumar', 'Manager', mainOfficeId, 'Medium Access'),
    ('accountant1', 'Deepa Nair', 'Accountant', mainOfficeId, 'Finance Access'),
    ('staff01', 'Sujith P', 'Staff', mainOfficeId, 'Limited Access'),
    ('staff02', 'Meera S', 'Staff', cityCafeId, 'Limited Access'),
    ('acc_riverside', 'Arjun Das', 'Accountant', riversideId, 'Finance Access'),
    ('staff_ctu', 'Fathima K', 'Staff', corpTradingId, 'Limited Access'),
  ];
  await core.batch((b) {
    for (final (username, fullName, role, businessId, accessLevel) in userSeeds) {
      final userId = _uuid.v4();
      b.insert(
        core.users,
        UsersCompanion.insert(
          id: userId,
          username: username,
          passwordHash: 'demo', // demo-only placeholder; see docs/database-architecture.md
          fullName: fullName,
          isSuperAdmin: Value(username == 'admin'),
          createdAt: now,
        ),
      );
      b.insert(
        core.userBusinessRoles,
        UserBusinessRolesCompanion.insert(
          id: _uuid.v4(),
          userId: userId,
          businessId: businessId,
          roleId: roleIds[role]!,
          accessLevel: accessLevel,
        ),
      );
    }
  });

  await core.into(core.appSettings).insert(const AppSettingsCompanion(key: Value('setup_mode'), value: Value('lan')));

  // Representative data for Main Office — the business the mock design's
  // Dashboard / Payroll / Inventory / Reports screens show numbers for.
  final mainDb = openBusinessDb('biz_main_office.db');
  await _seedMainOffice(mainDb, now);

  // Other three businesses start with just a chart of accounts so the
  // Multi-Branch "Independent & Isolated" story is real, not just a label.
  for (final dbFile in ['biz_city_cafe.db', 'biz_riverside_cafe.db', 'biz_corp_trading.db']) {
    final db = openBusinessDb(dbFile);
    await _seedChartOfAccounts(db);
  }
}

Future<void> _seedChartOfAccounts(BusinessDatabase db) async {
  final existing = await db.select(db.chartOfAccounts).get();
  if (existing.isNotEmpty) return;
  const accounts = [
    ('1000', 'Cash in Hand', 'asset'),
    ('1010', 'Bank Account', 'asset'),
    ('4000', 'Sales Income', 'income'),
    ('5000', 'Office Expenses', 'expense'),
  ];
  await db.batch((b) {
    for (final (code, name, type) in accounts) {
      b.insert(db.chartOfAccounts, ChartOfAccountsCompanion.insert(id: _uuid.v4(), code: code, name: name, accountType: type));
    }
  });
}

Future<void> _seedMainOffice(BusinessDatabase db, DateTime now) async {
  final existing = await db.select(db.employees).get();
  if (existing.isNotEmpty) return;

  await _seedChartOfAccounts(db);

  final sbiId = _uuid.v4();
  final hdfcId = _uuid.v4();
  await db.batch((b) {
    b.insert(db.bankAccounts, BankAccountsCompanion.insert(id: sbiId, accountName: 'SBI Bank A/c', accountNumber: 'XXXX-4521', bankName: 'State Bank of India', openingBalance: 300000000, currentBalance: 456832045));
    b.insert(db.bankAccounts, BankAccountsCompanion.insert(id: hdfcId, accountName: 'HDFC Bank A/c', accountNumber: 'XXXX-7788', bankName: 'HDFC Bank', openingBalance: 100000000, currentBalance: 125000000));
  });

  final txns = [
    ('Sales Invoice - INV-1258', 'Sales', sbiId, 7560000, 'credit', 'completed'),
    ('Office Rent - May 2025', 'Rent', sbiId, 4500000, 'debit', 'completed'),
    ('Purchase - PO-4587', 'Purchase', hdfcId, 12540000, 'debit', 'completed'),
    ('Electricity Bill - Office', 'Utilities', null, 825000, 'debit', 'completed'),
    ('Staff Salary - May 2025', 'Salary', sbiId, 38500000, 'debit', 'completed'),
    ('Petty Cash Expense', 'Office Expense', null, 125000, 'debit', 'pending'),
  ];
  await db.batch((b) {
    for (var i = 0; i < txns.length; i++) {
      final (desc, category, acct, amount, direction, status) = txns[i];
      b.insert(
        db.transactions,
        TransactionsCompanion.insert(
          id: _uuid.v4(),
          txnDate: now.subtract(Duration(days: i)),
          description: desc,
          category: category,
          accountId: Value(acct),
          amount: amount,
          direction: direction,
          status: Value(status),
          sourceModule: 'seed',
        ),
      );
    }
  });

  final employees = [
    ('EMP-001', 'Arun Kumar', 'Administration', 'Manager', 4500000, 'permanent'),
    ('EMP-002', 'Neha Sharma', 'Finance', 'Accountant', 3800000, 'permanent'),
    ('EMP-003', 'Ravi Patel', 'Sales', 'Executive', 2800000, 'contractual'),
    ('EMP-004', 'Priya Nair', 'HR', 'Executive', 3200000, 'permanent'),
    ('EMP-005', 'Suresh Babu', 'Operations', 'Supervisor', 2600000, 'permanent'),
    ('EMP-006', 'Karthik R', 'IT', 'Support Engineer', 3000000, 'permanent'),
    ('EMP-007', 'Anjali Verma', 'Marketing', 'Executive', 2700000, 'contractual'),
    ('EMP-008', 'Mohammed Ali', 'Logistics', 'Associate', 2200000, 'contractual'),
  ];
  final empIds = <String>[];
  await db.batch((b) {
    for (final (code, name, dept, role, salary, status) in employees) {
      final id = _uuid.v4();
      empIds.add(id);
      b.insert(
        db.employees,
        EmployeesCompanion.insert(
          id: id,
          employeeCode: code,
          fullName: name,
          department: dept,
          roleTitle: role,
          basicSalary: salary,
          employmentStatus: status,
          joinedDate: now.subtract(const Duration(days: 400)),
        ),
      );
    }
  });

  final items = [
    ('ITM-001', 'A4 Paper (Ream)', 'Consumables', 'Ream', 21000, 120, 50),
    ('ITM-002', 'Ink Cartridge HP 678', 'Consumables', 'Nos', 95000, 18, 10),
    ('ITM-003', 'Stapler Machine', 'Office Supplies', 'Nos', 25000, 8, 10),
    ('ITM-004', 'Blue Ball Pen (Box)', 'Office Supplies', 'Box', 12000, 15, 20),
    ('ITM-005', 'Coffee Powder 500g', 'Store Inventory', 'Packs', 28000, 6, 8),
    ('ITM-006', 'Cleaning Liquid 1L', 'Consumables', 'Bottle', 18000, 3, 5),
    ('ITM-007', 'Printer Paper Tray', 'Office Supplies', 'Nos', 65000, 2, 5),
    ('ITM-008', 'Visitor Log Book', 'Office Supplies', 'Nos', 7500, 25, 10),
  ];
  await db.batch((b) {
    for (final (code, name, category, unit, unitCost, qty, minLevel) in items) {
      b.insert(
        db.inventoryItems,
        InventoryItemsCompanion.insert(id: _uuid.v4(), itemCode: code, itemName: name, category: category, unit: unit, unitCost: unitCost, quantityOnHand: qty, minimumLevel: minLevel),
      );
    }
  });

  final assets = [
    ('AST-001', 'Office Air Conditioner', 'Equipment', 8500000, 'straight_line', 8),
    ('AST-002', 'Delivery Van', 'Vehicle', 45000000, 'declining_balance', 10),
    ('AST-003', 'Office Furniture Set', 'Furniture', 3200000, 'straight_line', 12),
  ];
  await db.batch((b) {
    for (final (code, name, category, cost, method, life) in assets) {
      b.insert(
        db.assets,
        AssetsCompanion.insert(id: _uuid.v4(), assetCode: code, name: name, category: category, purchaseDate: now.subtract(const Duration(days: 700)), purchaseCost: cost, depreciationMethod: method, usefulLifeYears: life),
      );
    }
  });

  final room = _uuid.v4();
  await db.into(db.meetingRooms).insert(MeetingRoomsCompanion.insert(id: room, roomName: 'Conference Room A', capacity: 10));
  await db.into(db.calendarEvents).insert(
        CalendarEventsCompanion.insert(
          id: _uuid.v4(),
          title: 'Management Meeting',
          eventType: 'management',
          eventDate: now,
          startTime: '10:00 AM',
          endTime: '11:00 AM',
          roomId: Value(room),
          createdByUserId: 'admin',
          attendeeCount: const Value(8),
        ),
      );
}
