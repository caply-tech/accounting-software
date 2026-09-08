import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

/// Not detailed in the mock design (the sidebar lists it, but no dedicated
/// screen was included among the 8 mockup pages) — built to the same
/// visual language as the other modules pending a confirmed design.
class AccountsFinanceScreen extends StatefulWidget {
  const AccountsFinanceScreen({super.key});

  @override
  State<AccountsFinanceScreen> createState() => _AccountsFinanceScreenState();
}

class _AccountsFinanceScreenState extends State<AccountsFinanceScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 3, vsync: this);

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
          tabs: const [Tab(text: 'Chart of Accounts'), Tab(text: 'Ledger'), Tab(text: 'Invoices')],
        ),
        const SizedBox(height: 20),
        SizedBox(height: 900, child: TabBarView(controller: _tabs, children: [_ChartOfAccountsTab(db: db), _LedgerTab(db: db), _InvoicesTab(db: db)])),
      ],
    );
  }
}

class _ChartOfAccountsTab extends StatelessWidget {
  const _ChartOfAccountsTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChartOfAccount>>(
      stream: db.select(db.chartOfAccounts).watch(),
      builder: (context, snapshot) {
        final accounts = snapshot.data ?? const <ChartOfAccount>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Chart of Accounts',
            action: ElevatedButton.icon(onPressed: () => _showAddAccountDialog(context, db), icon: const Icon(Icons.add), label: const Text('Add Account')),
            child: SizedBox(
              width: 600,
              child: DataTable(
                columns: const [DataColumn(label: Text('Code')), DataColumn(label: Text('Name')), DataColumn(label: Text('Type'))],
                rows: [for (final a in accounts) DataRow(cells: [DataCell(Text(a.code)), DataCell(Text(a.name)), DataCell(StatusBadge(a.accountType, tone: StatusTone.info))])],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showAddAccountDialog(BuildContext context, BusinessDatabase db) async {
    final codeCtrl = TextEditingController();
    final nameCtrl = TextEditingController();
    String type = 'asset';
    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Account'),
          content: SizedBox(
            width: 360,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(controller: codeCtrl, decoration: const InputDecoration(labelText: 'Account code')),
              const SizedBox(height: 12),
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Account name')),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'asset', child: Text('Asset')),
                  DropdownMenuItem(value: 'liability', child: Text('Liability')),
                  DropdownMenuItem(value: 'equity', child: Text('Equity')),
                  DropdownMenuItem(value: 'income', child: Text('Income')),
                  DropdownMenuItem(value: 'expense', child: Text('Expense')),
                ],
                onChanged: (v) => setState(() => type = v ?? 'asset'),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                await db.into(db.chartOfAccounts).insert(ChartOfAccountsCompanion.insert(id: const Uuid().v4(), code: codeCtrl.text.trim(), name: nameCtrl.text.trim(), accountType: type));
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LedgerTab extends StatelessWidget {
  const _LedgerTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Transaction>>(
      stream: (db.select(db.transactions)..orderBy([(t) => OrderingTerm.desc(t.txnDate)])).watch(),
      builder: (context, snapshot) {
        final txns = snapshot.data ?? const <Transaction>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'General Ledger',
            child: SizedBox(
              width: 700,
              child: DataTable(
                columns: const [DataColumn(label: Text('Date')), DataColumn(label: Text('Description')), DataColumn(label: Text('Category')), DataColumn(label: Text('Amount')), DataColumn(label: Text('Direction'))],
                rows: [
                  for (final t in txns)
                    DataRow(cells: [
                      DataCell(Text(formatDate(t.txnDate))),
                      DataCell(Text(t.description)),
                      DataCell(Text(t.category)),
                      DataCell(Text(formatInr(t.amount))),
                      DataCell(StatusBadge(t.direction, tone: t.direction == 'credit' ? StatusTone.success : StatusTone.critical)),
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

class _InvoicesTab extends StatelessWidget {
  const _InvoicesTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Invoice>>(
      stream: db.select(db.invoices).watch(),
      builder: (context, snapshot) {
        final invoices = snapshot.data ?? const <Invoice>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Invoices',
            action: ElevatedButton.icon(onPressed: () => _showAddInvoiceDialog(context, db), icon: const Icon(Icons.receipt_rounded), label: const Text('New Invoice')),
            child: invoices.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No invoices yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 700,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Invoice #')), DataColumn(label: Text('Customer')), DataColumn(label: Text('Total')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final i in invoices)
                          DataRow(cells: [DataCell(Text(i.invoiceNo)), DataCell(Text(i.customerName)), DataCell(Text(formatInr(i.total))), DataCell(StatusBadge(i.status, tone: i.status == 'paid' ? StatusTone.success : StatusTone.warning))]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Future<void> _showAddInvoiceDialog(BuildContext context, BusinessDatabase db) async {
    final customerCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Invoice'),
        content: SizedBox(
          width: 360,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: customerCtrl, decoration: const InputDecoration(labelText: 'Customer name')),
            const SizedBox(height: 12),
            TextField(controller: amountCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Total amount (₹)')),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (customerCtrl.text.trim().isEmpty) return;
              final total = ((double.tryParse(amountCtrl.text.trim()) ?? 0) * 100).round();
              final now = DateTime.now();
              await db.into(db.invoices).insert(
                    InvoicesCompanion.insert(
                      id: const Uuid().v4(),
                      invoiceNo: 'INV-${now.millisecondsSinceEpoch % 100000}',
                      customerName: customerCtrl.text.trim(),
                      invoiceDate: now,
                      dueDate: now.add(const Duration(days: 15)),
                      subtotal: total,
                      taxAmount: 0,
                      total: total,
                    ),
                  );
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
