import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

class PayrollStaffScreen extends StatefulWidget {
  const PayrollStaffScreen({super.key});

  @override
  State<PayrollStaffScreen> createState() => _PayrollStaffScreenState();
}

class _PayrollStaffScreenState extends State<PayrollStaffScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 5, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;
    if (business == null) return const Center(child: Text('No business selected.'));
    final db = context.watch<AppDatabases>().businessDb(business.dbFilename);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabs,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.navySoft,
          indicatorColor: AppColors.primary,
          tabs: const [Tab(text: 'Employees'), Tab(text: 'Attendance'), Tab(text: 'Leave'), Tab(text: 'Payroll'), Tab(text: 'Contracts')],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 900,
          child: TabBarView(
            controller: _tabs,
            children: [
              _EmployeesTab(db: db),
              _AttendanceTab(db: db),
              _LeaveTab(db: db),
              _PayrollTab(db: db),
              _ContractsTab(db: db),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmployeesTab extends StatelessWidget {
  const _EmployeesTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Employee>>(
      stream: db.select(db.employees).watch(),
      builder: (context, snapshot) {
        final employees = snapshot.data ?? const <Employee>[];
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.4,
                children: [
                  StatCard(label: 'Total Employees', value: '${employees.length}', icon: Icons.groups_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
                  StatCard(label: 'Permanent', value: '${employees.where((e) => e.employmentStatus == 'permanent').length}', icon: Icons.badge_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg),
                  StatCard(label: 'Contractual', value: '${employees.where((e) => e.employmentStatus == 'contractual').length}', icon: Icons.assignment_ind_rounded, iconColor: AppColors.warning, iconBg: AppColors.warningBg),
                  StatCard(label: 'Total Basic Salary', value: formatInr(employees.fold(0, (s, e) => s + e.basicSalary)), icon: Icons.payments_rounded, iconColor: AppColors.purple, iconBg: AppColors.purpleBg),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(onPressed: () => _showAddEmployeeDialog(context, db), icon: const Icon(Icons.person_add_alt_1), label: const Text('Add Employee')),
              const SizedBox(height: 20),
              SectionCard(
                title: 'Employee Overview',
                child: SizedBox(
                  width: 900,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Department / Role')),
                      DataColumn(label: Text('Basic Salary')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: [
                      for (final e in employees)
                        DataRow(cells: [
                          DataCell(Text(e.employeeCode)),
                          DataCell(Text(e.fullName)),
                          DataCell(Text('${e.department} / ${e.roleTitle}')),
                          DataCell(Text(formatInr(e.basicSalary))),
                          DataCell(StatusBadge(e.employmentStatus == 'permanent' ? 'Permanent' : 'Contractual', tone: e.employmentStatus == 'permanent' ? StatusTone.success : StatusTone.warning)),
                        ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showAddEmployeeDialog(BuildContext context, BusinessDatabase db) async {
    final codeCtrl = TextEditingController(text: 'EMP-${100 + DateTime.now().millisecond}');
    final nameCtrl = TextEditingController();
    final deptCtrl = TextEditingController();
    final roleCtrl = TextEditingController();
    final salaryCtrl = TextEditingController();
    String status = 'permanent';

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Employee'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: codeCtrl, decoration: const InputDecoration(labelText: 'Employee code')),
                const SizedBox(height: 12),
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Full name')),
                const SizedBox(height: 12),
                TextField(controller: deptCtrl, decoration: const InputDecoration(labelText: 'Department')),
                const SizedBox(height: 12),
                TextField(controller: roleCtrl, decoration: const InputDecoration(labelText: 'Role / title')),
                const SizedBox(height: 12),
                TextField(controller: salaryCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Basic salary (₹)')),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: status,
                  decoration: const InputDecoration(labelText: 'Employment status'),
                  items: const [DropdownMenuItem(value: 'permanent', child: Text('Permanent')), DropdownMenuItem(value: 'contractual', child: Text('Contractual'))],
                  onChanged: (v) => setState(() => status = v ?? 'permanent'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                final salary = (double.tryParse(salaryCtrl.text.trim()) ?? 0) * 100;
                await db.into(db.employees).insert(
                      EmployeesCompanion.insert(
                        id: const Uuid().v4(),
                        employeeCode: codeCtrl.text.trim(),
                        fullName: nameCtrl.text.trim(),
                        department: deptCtrl.text.trim(),
                        roleTitle: roleCtrl.text.trim(),
                        basicSalary: salary.round(),
                        employmentStatus: status,
                        joinedDate: DateTime.now(),
                      ),
                    );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Add Employee'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttendanceTab extends StatelessWidget {
  const _AttendanceTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
      future: db.select(db.employees).get(),
      builder: (context, snapshot) {
        final employees = snapshot.data ?? const <Employee>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: "Today's Attendance",
            action: OutlinedButton.icon(
              onPressed: () async {
                for (final e in employees) {
                  await db.into(db.attendance).insert(
                        AttendanceCompanion.insert(id: const Uuid().v4(), employeeId: e.id, date: DateTime.now(), status: 'present'),
                      );
                }
                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Attendance recorded for all employees.')));
              },
              icon: const Icon(Icons.how_to_reg_rounded),
              label: const Text('Record Attendance'),
            ),
            child: SizedBox(
              width: 600,
              child: DataTable(
                columns: const [DataColumn(label: Text('Employee')), DataColumn(label: Text('Department')), DataColumn(label: Text('Status'))],
                rows: [
                  for (final e in employees)
                    DataRow(cells: [DataCell(Text(e.fullName)), DataCell(Text(e.department)), const DataCell(StatusBadge('Present', tone: StatusTone.success))]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LeaveTab extends StatelessWidget {
  const _LeaveTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LeaveRequest>>(
      stream: db.select(db.leaveRequests).watch(),
      builder: (context, snapshot) {
        final leaves = snapshot.data ?? const <LeaveRequest>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Leave Requests',
            child: leaves.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No leave requests yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 600,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Type')), DataColumn(label: Text('From')), DataColumn(label: Text('To')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final l in leaves)
                          DataRow(cells: [
                            DataCell(Text(l.leaveType)),
                            DataCell(Text(formatDate(l.fromDate))),
                            DataCell(Text(formatDate(l.toDate))),
                            DataCell(StatusBadge(l.status, tone: l.status == 'approved' ? StatusTone.success : StatusTone.warning)),
                          ]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class _PayrollTab extends StatelessWidget {
  const _PayrollTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
      future: db.select(db.employees).get(),
      builder: (context, snapshot) {
        final employees = snapshot.data ?? const <Employee>[];
        final gross = employees.fold<int>(0, (s, e) => s + e.basicSalary);
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Payroll Summary',
            action: ElevatedButton.icon(
              onPressed: () async {
                final runId = const Uuid().v4();
                await db.into(db.payrollRuns).insert(
                      PayrollRunsCompanion.insert(
                        id: runId,
                        periodMonth: DateTime.now().month,
                        periodYear: DateTime.now().year,
                        grossPayroll: gross,
                        allowances: (gross * 0.2).round(),
                        overtime: 0,
                        deductions: (gross * 0.15).round(),
                        netPay: (gross * 1.05).round(),
                        generatedAt: DateTime.now(),
                      ),
                    );
                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payroll run generated.')));
              },
              icon: const Icon(Icons.receipt_long_rounded),
              label: const Text('Process Payroll'),
            ),
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _summaryRow('Gross Payroll (Basic Salary)', gross),
                  _summaryRow('Allowances (est.)', (gross * 0.2).round()),
                  _summaryRow('Deductions (est.)', (gross * 0.15).round()),
                  const Divider(),
                  _summaryRow('Net Pay (est.)', (gross * 1.05).round(), bold: true),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _summaryRow(String label, int amount, {bool bold = false}) {
    final style = TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: style), Text(formatInr(amount), style: style)]),
    );
  }
}

class _ContractsTab extends StatelessWidget {
  const _ContractsTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EmploymentContract>>(
      stream: db.select(db.employmentContracts).watch(),
      builder: (context, snapshot) {
        final contracts = snapshot.data ?? const <EmploymentContract>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Employment Contracts',
            child: contracts.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No contracts recorded yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 600,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Position')), DataColumn(label: Text('Type')), DataColumn(label: Text('Start')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final c in contracts)
                          DataRow(cells: [DataCell(Text(c.position)), DataCell(Text(c.contractType)), DataCell(Text(formatDate(c.startDate))), DataCell(StatusBadge(c.status, tone: StatusTone.info))]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
