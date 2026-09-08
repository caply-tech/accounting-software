import 'package:drift/drift.dart' show OrderingTerm;
import 'package:excel/excel.dart' as xls;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _format = 'pdf';
  bool _generating = false;

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;
    if (business == null) return const Center(child: Text('No business selected.'));
    final db = context.watch<AppDatabases>().businessDb(business.dbFilename);

    return StreamBuilder<List<GeneratedReport>>(
      stream: (db.select(db.generatedReports)..orderBy([(r) => OrderingTerm.desc(r.generatedAt)])).watch(),
      builder: (context, snapshot) {
        final reports = snapshot.data ?? const <GeneratedReport>[];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionCard(
              title: 'Report Generator',
              child: SizedBox(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Income & Expense Report — current fiscal year, from live ledger data', style: TextStyle(color: AppColors.navySoft, fontSize: 13)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('Format: '),
                        const SizedBox(width: 8),
                        ChoiceChip(label: const Text('PDF'), selected: _format == 'pdf', onSelected: (_) => setState(() => _format = 'pdf')),
                        const SizedBox(width: 8),
                        ChoiceChip(label: const Text('Excel'), selected: _format == 'excel', onSelected: (_) => setState(() => _format = 'excel')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _generating ? null : () => _generateReport(context, db, business.name),
                      icon: _generating ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.description_rounded),
                      label: Text(_generating ? 'Generating…' : 'Generate Report'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: 'Recent Reports',
              child: reports.isEmpty
                  ? const Padding(padding: EdgeInsets.all(20), child: Text('No reports generated yet.', style: TextStyle(color: AppColors.navySoft)))
                  : SizedBox(
                      width: 700,
                      child: DataTable(
                        columns: const [DataColumn(label: Text('Report')), DataColumn(label: Text('Generated On')), DataColumn(label: Text('Format')), DataColumn(label: Text(''))],
                        rows: [
                          for (final r in reports)
                            DataRow(cells: [
                              DataCell(Text(r.reportName)),
                              DataCell(Text(formatDate(r.generatedAt))),
                              DataCell(Text(r.format.toUpperCase())),
                              DataCell(TextButton(onPressed: () => _openReport(r.filePath), child: const Text('Open / Print'))),
                            ]),
                        ],
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _generateReport(BuildContext context, BusinessDatabase db, String businessName) async {
    setState(() => _generating = true);
    try {
      final txns = await db.select(db.transactions).get();
      final income = txns.where((t) => t.direction == 'credit').fold<int>(0, (s, t) => s + t.amount);
      final expenses = txns.where((t) => t.direction == 'debit').fold<int>(0, (s, t) => s + t.amount);
      final dir = await getApplicationSupportDirectory();
      final reportsDir = Directory('${dir.path}/AccountingSoftware/reports');
      if (!await reportsDir.exists()) await reportsDir.create(recursive: true);

      final filename = 'income_expense_${DateTime.now().millisecondsSinceEpoch}.$_format';
      final filePath = '${reportsDir.path}/$filename';

      if (_format == 'pdf') {
        final doc = pw.Document();
        doc.addPage(
          pw.Page(
            build: (pwContext) => pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Income & Expense Report', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.Text(businessName),
                pw.SizedBox(height: 16),
                pw.Table.fromTextArray(headers: const ['Date', 'Description', 'Category', 'Amount', 'Direction'], data: [
                  for (final t in txns) [formatDate(t.txnDate), t.description, t.category, formatInr(t.amount), t.direction],
                ]),
                pw.SizedBox(height: 16),
                pw.Text('Total Income: ${formatInr(income)}'),
                pw.Text('Total Expenses: ${formatInr(expenses)}'),
                pw.Text('Net: ${formatInr(income - expenses)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ),
        );
        final bytes = await doc.save();
        await File(filePath).writeAsBytes(bytes);
      } else {
        final workbook = xls.Excel.createExcel();
        final sheet = workbook['Income & Expense'];
        sheet.appendRow(['Date', 'Description', 'Category', 'Amount (INR)', 'Direction'].map(xls.TextCellValue.new).toList());
        for (final t in txns) {
          sheet.appendRow([formatDate(t.txnDate), t.description, t.category, (t.amount / 100).toStringAsFixed(2), t.direction].map(xls.TextCellValue.new).toList());
        }
        final bytes = workbook.encode();
        if (bytes != null) await File(filePath).writeAsBytes(bytes);
      }

      await db.into(db.generatedReports).insert(
            GeneratedReportsCompanion.insert(
              id: const Uuid().v4(),
              reportName: 'Income & Expense Report',
              reportType: 'income_expense',
              dateFrom: DateTime.now().subtract(const Duration(days: 365)),
              dateTo: DateTime.now(),
              format: _format,
              generatedAt: DateTime.now(),
              filePath: filePath,
            ),
          );
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  Future<void> _openReport(String path) async {
    if (path.endsWith('.pdf')) {
      final bytes = await File(path).readAsBytes();
      await Printing.layoutPdf(onLayout: (format) async => bytes);
    }
  }
}
