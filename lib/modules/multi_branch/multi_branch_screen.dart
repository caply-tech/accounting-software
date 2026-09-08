import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/core_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/stat_card.dart';

class MultiBranchScreen extends StatefulWidget {
  const MultiBranchScreen({super.key});

  @override
  State<MultiBranchScreen> createState() => _MultiBranchScreenState();
}

class _MultiBranchScreenState extends State<MultiBranchScreen> {
  @override
  Widget build(BuildContext context) {
    final databases = context.watch<AppDatabases>();
    final session = context.watch<SessionState>();

    return StreamBuilder<List<BusinessesData>>(
      stream: databases.core.select(databases.core.businesses).watch(),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? const <BusinessesData>[];
        final active = rows.where((b) => b.status == 'active').length;
        return Column(
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
                StatCard(label: 'Total Businesses', value: '${rows.length}', icon: Icons.apartment_rounded, iconColor: AppColors.primary, iconBg: AppColors.primary.withValues(alpha: 0.12)),
                StatCard(label: 'Active Businesses', value: '$active', icon: Icons.check_circle_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg),
                StatCard(label: 'Inactive Businesses', value: '${rows.length - active}', icon: Icons.pause_circle_rounded, iconColor: AppColors.critical, iconBg: AppColors.criticalBg),
                StatCard(label: 'Current Selected Business', value: session.currentBusiness?.name ?? '—', icon: Icons.business_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton.icon(onPressed: () => _showAddBusinessDialog(context, databases), icon: const Icon(Icons.add), label: const Text('Add Business')),
              ],
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: 'All Businesses',
              child: SizedBox(
                width: 900,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Business Name')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Location')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: [
                    for (final b in rows)
                      DataRow(cells: [
                        DataCell(Text(b.name, style: const TextStyle(fontWeight: FontWeight.w600))),
                        DataCell(Text(b.businessType)),
                        DataCell(Text(b.location)),
                        DataCell(StatusBadge(b.status == 'active' ? 'Active' : 'Inactive', tone: b.status == 'active' ? StatusTone.success : StatusTone.neutral)),
                        DataCell(TextButton(
                          onPressed: () {
                            session.switchBusiness(BusinessSummary(id: b.id, name: b.name, businessType: b.businessType, location: b.location, isHeadOffice: b.isHeadOffice, dbFilename: b.dbFilename));
                            session.setModule(AppModule.dashboard);
                          },
                          child: const Text('Switch to'),
                        )),
                      ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: AppColors.infoBg, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Icon(Icons.lock_outline, color: AppColors.info),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Independent & Isolated Businesses — each business keeps its own database file. Data is completely separate and never shared or synchronized with any external system.',
                      style: TextStyle(fontSize: 13, color: AppColors.navy),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddBusinessDialog(BuildContext context, AppDatabases databases) async {
    final nameCtrl = TextEditingController();
    final typeCtrl = TextEditingController();
    final locationCtrl = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Business'),
        content: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Business name')),
              const SizedBox(height: 12),
              TextField(controller: typeCtrl, decoration: const InputDecoration(labelText: 'Business type')),
              const SizedBox(height: 12),
              TextField(controller: locationCtrl, decoration: const InputDecoration(labelText: 'Location')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              final id = const Uuid().v4();
              final dbFile = 'biz_${id.substring(0, 8)}.db';
              final now = DateTime.now();
              await databases.core.into(databases.core.businesses).insert(
                    BusinessesCompanion.insert(
                      id: id,
                      name: nameCtrl.text.trim(),
                      businessType: typeCtrl.text.trim().isEmpty ? 'General' : typeCtrl.text.trim(),
                      location: locationCtrl.text.trim(),
                      dbFilename: dbFile,
                      fiscalYearLabel: '2024-2025',
                      createdAt: now,
                      lastActivityAt: now,
                      status: const Value('active'),
                    ),
                  );
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Add Business'),
          ),
        ],
      ),
    );
  }
}
