import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

/// Not detailed in the mock design (sidebar-only, no dedicated screen among
/// the 8 mockup pages) — built to the same visual language pending a
/// confirmed design.
class AssetValuationScreen extends StatelessWidget {
  const AssetValuationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;
    if (business == null) return const Center(child: Text('No business selected.'));
    final db = context.watch<AppDatabases>().businessDb(business.dbFilename);

    return StreamBuilder<List<Asset>>(
      stream: db.select(db.assets).watch(),
      builder: (context, snapshot) {
        final assets = snapshot.data ?? const <Asset>[];
        final totalValue = assets.fold<int>(0, (s, a) => s + a.purchaseCost);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.6,
                children: [
                  StatCard(label: 'Total Assets', value: '${assets.length}', icon: Icons.inventory_2_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
                  StatCard(label: 'Total Purchase Value', value: formatInr(totalValue), icon: Icons.savings_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg),
                  StatCard(label: 'Categories', value: '${assets.map((a) => a.category).toSet().length}', icon: Icons.category_rounded, iconColor: AppColors.purple, iconBg: AppColors.purpleBg),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(onPressed: () => _showAddAssetDialog(context, db), icon: const Icon(Icons.add), label: const Text('Add Asset')),
              const SizedBox(height: 20),
              SectionCard(
                title: 'Asset Register',
                child: SizedBox(
                  width: 800,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Code')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Category')),
                      DataColumn(label: Text('Purchase Cost')),
                      DataColumn(label: Text('Depreciation')),
                      DataColumn(label: Text('Useful Life')),
                    ],
                    rows: [
                      for (final a in assets)
                        DataRow(cells: [
                          DataCell(Text(a.assetCode)),
                          DataCell(Text(a.name)),
                          DataCell(Text(a.category)),
                          DataCell(Text(formatInr(a.purchaseCost))),
                          DataCell(Text(a.depreciationMethod == 'straight_line' ? 'Straight Line' : 'Declining Balance')),
                          DataCell(Text('${a.usefulLifeYears} yrs')),
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

  Future<void> _showAddAssetDialog(BuildContext context, BusinessDatabase db) async {
    final codeCtrl = TextEditingController(text: 'AST-${100 + DateTime.now().millisecond}');
    final nameCtrl = TextEditingController();
    final categoryCtrl = TextEditingController();
    final costCtrl = TextEditingController();
    final lifeCtrl = TextEditingController(text: '5');
    String method = 'straight_line';

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Asset'),
          content: SizedBox(
            width: 380,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(controller: codeCtrl, decoration: const InputDecoration(labelText: 'Asset code')),
                const SizedBox(height: 12),
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Asset name')),
                const SizedBox(height: 12),
                TextField(controller: categoryCtrl, decoration: const InputDecoration(labelText: 'Category')),
                const SizedBox(height: 12),
                TextField(controller: costCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Purchase cost (₹)')),
                const SizedBox(height: 12),
                TextField(controller: lifeCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Useful life (years)')),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: method,
                  decoration: const InputDecoration(labelText: 'Depreciation method'),
                  items: const [DropdownMenuItem(value: 'straight_line', child: Text('Straight Line')), DropdownMenuItem(value: 'declining_balance', child: Text('Declining Balance'))],
                  onChanged: (v) => setState(() => method = v ?? 'straight_line'),
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                await db.into(db.assets).insert(
                      AssetsCompanion.insert(
                        id: const Uuid().v4(),
                        assetCode: codeCtrl.text.trim(),
                        name: nameCtrl.text.trim(),
                        category: categoryCtrl.text.trim(),
                        purchaseDate: DateTime.now(),
                        purchaseCost: ((double.tryParse(costCtrl.text.trim()) ?? 0) * 100).round(),
                        depreciationMethod: method,
                        usefulLifeYears: int.tryParse(lifeCtrl.text.trim()) ?? 5,
                      ),
                    );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Add Asset'),
            ),
          ],
        ),
      ),
    );
  }
}
