import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;

part 'business_database.g.dart';

// ---------------------------------------------------------------------------
// Accounts & Finance
// ---------------------------------------------------------------------------

class ChartOfAccounts extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get accountType => text()(); // asset|liability|equity|income|expense
  TextColumn get parentAccountId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

class JournalEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get entryDate => dateTime()();
  TextColumn get referenceNo => text()();
  TextColumn get description => text()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  TextColumn get createdByUserId => text()();
  IntColumn get totalDebit => integer()(); // minor units (paise)
  IntColumn get totalCredit => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class JournalLines extends Table {
  TextColumn get id => text()();
  TextColumn get journalEntryId => text().references(JournalEntries, #id)();
  TextColumn get accountId => text().references(ChartOfAccounts, #id)();
  IntColumn get debit => integer().withDefault(const Constant(0))();
  IntColumn get credit => integer().withDefault(const Constant(0))();
  TextColumn get memo => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class BankAccounts extends Table {
  TextColumn get id => text()();
  TextColumn get accountName => text()();
  TextColumn get accountNumber => text()();
  TextColumn get bankName => text()();
  IntColumn get openingBalance => integer()();
  IntColumn get currentBalance => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Backs the Reports screen's "Bank Reconciliation Report" — a point-in-time
/// record (this statement, this date, matched to this balance) that isn't
/// implicitly recoverable from BankAccounts + JournalLines alone.
class BankReconciliations extends Table {
  TextColumn get id => text()();
  TextColumn get bankAccountId => text().references(BankAccounts, #id)();
  DateTimeColumn get statementDate => dateTime()();
  IntColumn get statementBalance => integer()();
  IntColumn get reconciledBalance => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending | reconciled

  @override
  Set<Column> get primaryKey => {id};
}

class Invoices extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceNo => text()();
  TextColumn get customerName => text()();
  DateTimeColumn get invoiceDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get subtotal => integer()();
  IntColumn get taxAmount => integer()();
  IntColumn get total => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}

class InvoiceLineItems extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceId => text().references(Invoices, #id)();
  TextColumn get description => text()();
  IntColumn get quantity => integer()();
  IntColumn get unitPrice => integer()();
  RealColumn get taxRate => real().withDefault(const Constant(0))();
  IntColumn get lineTotal => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// The single ledger feed the Dashboard and Reports both read from.
/// Every module (payroll run, inventory purchase, invoice payment) inserts
/// one row here instead of the dashboard unioning five module tables live.
class Transactions extends Table {
  TextColumn get id => text()();
  DateTimeColumn get txnDate => dateTime()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  TextColumn get accountId => text().nullable().references(BankAccounts, #id)();
  IntColumn get amount => integer()();
  TextColumn get direction => text()(); // debit | credit
  TextColumn get status => text().withDefault(const Constant('completed'))();
  TextColumn get sourceModule => text()();
  TextColumn get sourceId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Budgets extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get fiscalYear => text()();
  IntColumn get periodMonth => integer()();
  IntColumn get budgetedAmount => integer()();
  IntColumn get actualAmount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Payroll & Staff
// ---------------------------------------------------------------------------

class Employees extends Table {
  TextColumn get id => text()();
  TextColumn get employeeCode => text()();
  TextColumn get fullName => text()();
  TextColumn get department => text()();
  TextColumn get roleTitle => text()();
  IntColumn get basicSalary => integer()();
  TextColumn get employmentStatus => text()(); // permanent | contractual
  DateTimeColumn get joinedDate => dateTime()();
  TextColumn get contactPhone => text().nullable()();
  TextColumn get contactEmail => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Attendance extends Table {
  TextColumn get id => text()();
  TextColumn get employeeId => text().references(Employees, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()(); // present|absent|late|on_leave
  DateTimeColumn get checkInTime => dateTime().nullable()();
  DateTimeColumn get checkOutTime => dateTime().nullable()();
  IntColumn get lateMinutes => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class LeaveRequests extends Table {
  TextColumn get id => text()();
  TextColumn get employeeId => text().references(Employees, #id)();
  TextColumn get leaveType => text()();
  DateTimeColumn get fromDate => dateTime()();
  DateTimeColumn get toDate => dateTime()();
  IntColumn get days => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  TextColumn get reason => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LeaveBalances extends Table {
  TextColumn get id => text()();
  TextColumn get employeeId => text().references(Employees, #id)();
  TextColumn get leaveType => text()();
  TextColumn get fiscalYear => text()();
  IntColumn get balanceDays => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class PayrollRuns extends Table {
  TextColumn get id => text()();
  IntColumn get periodMonth => integer()();
  IntColumn get periodYear => integer()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  IntColumn get grossPayroll => integer()();
  IntColumn get allowances => integer()();
  IntColumn get overtime => integer()();
  IntColumn get deductions => integer()();
  IntColumn get netPay => integer()();
  DateTimeColumn get generatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class PayrollItems extends Table {
  TextColumn get id => text()();
  TextColumn get payrollRunId => text().references(PayrollRuns, #id)();
  TextColumn get employeeId => text().references(Employees, #id)();
  IntColumn get basicSalary => integer()();
  IntColumn get allowances => integer()();
  IntColumn get overtime => integer()();
  IntColumn get deductions => integer()();
  IntColumn get netPay => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class EmploymentContracts extends Table {
  TextColumn get id => text()();
  TextColumn get employeeId => text().references(Employees, #id)();
  TextColumn get position => text()();
  TextColumn get contractType => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Asset & Valuation
// ---------------------------------------------------------------------------

class Assets extends Table {
  TextColumn get id => text()();
  TextColumn get assetCode => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  DateTimeColumn get purchaseDate => dateTime()();
  IntColumn get purchaseCost => integer()();
  TextColumn get depreciationMethod => text()();
  IntColumn get usefulLifeYears => integer()();
  IntColumn get salvageValue => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('in_use'))();

  @override
  Set<Column> get primaryKey => {id};
}

class AssetDepreciationSchedule extends Table {
  TextColumn get id => text()();
  TextColumn get assetId => text().references(Assets, #id)();
  IntColumn get periodMonth => integer()();
  IntColumn get periodYear => integer()();
  IntColumn get depreciationAmount => integer()();
  IntColumn get accumulatedDepreciation => integer()();
  IntColumn get bookValue => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class AssetValuations extends Table {
  TextColumn get id => text()();
  TextColumn get assetId => text().references(Assets, #id)();
  DateTimeColumn get valuationDate => dateTime()();
  IntColumn get valuationAmount => integer()();
  TextColumn get valuerName => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Inventory Management
// ---------------------------------------------------------------------------

class InventoryItems extends Table {
  TextColumn get id => text()();
  TextColumn get itemCode => text()();
  TextColumn get itemName => text()();
  TextColumn get category => text()();
  TextColumn get unit => text()();
  IntColumn get unitCost => integer()();
  IntColumn get quantityOnHand => integer()();
  IntColumn get minimumLevel => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class InventoryPurchases extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text().references(InventoryItems, #id)();
  TextColumn get supplierName => text()();
  DateTimeColumn get purchaseDate => dateTime()();
  IntColumn get quantity => integer()();
  IntColumn get unitCost => integer()();
  IntColumn get totalCost => integer()();
  TextColumn get status => text().withDefault(const Constant('received'))();

  @override
  Set<Column> get primaryKey => {id};
}

class InventoryAdjustments extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text().references(InventoryItems, #id)();
  DateTimeColumn get adjustmentDate => dateTime()();
  TextColumn get adjustmentType => text()(); // addition|deduction|correction
  IntColumn get quantityDelta => integer()();
  TextColumn get reason => text()();
  TextColumn get userId => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Event & Calendar
// ---------------------------------------------------------------------------

class MeetingRooms extends Table {
  TextColumn get id => text()();
  TextColumn get roomName => text()();
  IntColumn get capacity => integer()();
  TextColumn get status => text().withDefault(const Constant('available'))();

  @override
  Set<Column> get primaryKey => {id};
}

class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get eventType => text()(); // management|finance|staff|board
  DateTimeColumn get eventDate => dateTime()();
  TextColumn get startTime => text()();
  TextColumn get endTime => text()();
  TextColumn get roomId => text().nullable().references(MeetingRooms, #id)();
  TextColumn get description => text().nullable()();
  TextColumn get createdByUserId => text()();
  IntColumn get attendeeCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class RoomBookings extends Table {
  TextColumn get id => text()();
  TextColumn get roomId => text().references(MeetingRooms, #id)();
  TextColumn get eventId => text().nullable().references(CalendarEvents, #id)();
  DateTimeColumn get bookedFrom => dateTime()();
  DateTimeColumn get bookedTo => dateTime()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Reports
// ---------------------------------------------------------------------------

class ReportTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get reportType => text()();
  TextColumn get filtersJson => text()();
  TextColumn get createdByUserId => text()();
  BoolColumn get isScheduled => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class GeneratedReports extends Table {
  TextColumn get id => text()();
  TextColumn get templateId => text().nullable().references(ReportTemplates, #id)();
  TextColumn get reportName => text()();
  TextColumn get reportType => text()();
  DateTimeColumn get dateFrom => dateTime()();
  DateTimeColumn get dateTo => dateTime()();
  TextColumn get format => text()(); // pdf | excel
  DateTimeColumn get generatedAt => dateTime()();
  TextColumn get filePath => text()();
  TextColumn get status => text().withDefault(const Constant('completed'))();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Audit (scoped to this business — see docs/database-architecture.md)
// ---------------------------------------------------------------------------

/// `userId` points at a row in core.db's `users` table — a different SQLite
/// file, so SQLite cannot enforce that reference as a foreign key. Fix:
/// `userName` is a denormalized snapshot of that user's username, captured
/// by the caller at write time (never looked up later), so this row stays
/// self-contained and readable even if the referenced user is later
/// renamed or removed from core.db. Every write path MUST resolve and pass
/// the current username alongside the id — see docs/database-architecture.md
/// "Cross-file references aren't enforced" for the full rationale.
class AuditLog extends Table {
  TextColumn get id => text()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get userId => text()();
  TextColumn get userName => text()();
  TextColumn get action => text()();
  TextColumn get module => text()();
  TextColumn get status => text()();
  TextColumn get detailsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  ChartOfAccounts,
  JournalEntries,
  JournalLines,
  BankAccounts,
  BankReconciliations,
  Invoices,
  InvoiceLineItems,
  Transactions,
  Budgets,
  Employees,
  Attendance,
  LeaveRequests,
  LeaveBalances,
  PayrollRuns,
  PayrollItems,
  EmploymentContracts,
  Assets,
  AssetDepreciationSchedule,
  AssetValuations,
  InventoryItems,
  InventoryPurchases,
  InventoryAdjustments,
  MeetingRooms,
  CalendarEvents,
  RoomBookings,
  ReportTemplates,
  GeneratedReports,
  AuditLog,
])
class BusinessDatabase extends _$BusinessDatabase {
  BusinessDatabase(String businessDbFilename) : super(impl.openConnection(businessDbFilename));

  @override
  int get schemaVersion => 1;
}
