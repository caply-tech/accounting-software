import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 4, vsync: this);

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
          tabs: const [Tab(text: 'Stock Control'), Tab(text: 'Purchases'), Tab(text: 'Inventory Adjustments'), Tab(text: 'Alerts')],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 900,
          child: TabBarView(controller: _tabs, children: [_StockControlTab(db: db), _PurchasesTab(db: db), _AdjustmentsTab(db: db), _AlertsTab(db: db)]),
        ),
      ],
    );
  }
}

class _StockControlTab extends StatelessWidget {
  const _StockControlTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InventoryItem>>(
      stream: db.select(db.inventoryItems).watch(),
      builder: (context, snapshot) {
        final items = snapshot.data ?? const <InventoryItem>[];
        final totalValue = items.fold<int>(0, (s, i) => s + i.unitCost * i.quantityOnHand);
        final lowStock = items.where((i) => i.quantityOnHand <= i.minimumLevel).length;

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
                  StatCard(label: 'Total Items', value: '${items.length}', icon: Icons.inventory_2_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
                  StatCard(label: 'Total Stock Value', value: formatInr(totalValue), icon: Icons.dataset_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg),
                  StatCard(label: 'Low Stock Items', value: '$lowStock', icon: Icons.warning_amber_rounded, iconColor: AppColors.warning, iconBg: AppColors.warningBg),
                  StatCard(label: 'Categories', value: '${items.map((i) => i.category).toSet().length}', icon: Icons.category_rounded, iconColor: AppColors.purple, iconBg: AppColors.purpleBg),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(onPressed: () => _showAddItemDialog(context, db), icon: const Icon(Icons.add_box_rounded), label: const Text('Add Item')),
              const SizedBox(height: 20),
              SectionCard(
                title: 'Current Stock Overview',
                child: SizedBox(
                  width: 900,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Code')),
                      DataColumn(label: Text('Item')),
                      DataColumn(label: Text('Category')),
                      DataColumn(label: Text('Qty')),
                      DataColumn(label: Text('Unit Cost')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: [
                      for (final i in items)
                        DataRow(cells: [
                          DataCell(Text(i.itemCode)),
                          DataCell(Text(i.itemName)),
                          DataCell(Text(i.category)),
                          DataCell(Text('${i.quantityOnHand} ${i.unit}')),
                          DataCell(Text(formatInr(i.unitCost))),
                          DataCell(_stockBadge(i)),
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

  Widget _stockBadge(InventoryItem i) {
    if (i.quantityOnHand < i.minimumLevel * 0.5) return const StatusBadge('Critical', tone: StatusTone.critical);
    if (i.quantityOnHand <= i.minimumLevel) return const StatusBadge('Low Stock', tone: StatusTone.warning);
    return const StatusBadge('In Stock', tone: StatusTone.success);
  }

  Future<void> _showAddItemDialog(BuildContext context, BusinessDatabase db) async {
    final codeCtrl = TextEditingController(text: 'ITM-${100 + DateTime.now().millisecond}');
    final nameCtrl = TextEditingController();
    final categoryCtrl = TextEditingController();
    final unitCtrl = TextEditingController(text: 'Nos');
    final costCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    final minCtrl = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Item'),
        content: SizedBox(
          width: 380,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: codeCtrl, decoration: const InputDecoration(labelText: 'Item code')),
                const SizedBox(height: 12),
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Item name')),
                const SizedBox(height: 12),
                TextField(controller: categoryCtrl, decoration: const InputDecoration(labelText: 'Category')),
                const SizedBox(height: 12),
                TextField(controller: unitCtrl, decoration: const InputDecoration(labelText: 'Unit')),
                const SizedBox(height: 12),
                TextField(controller: costCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Unit cost (₹)')),
                const SizedBox(height: 12),
                TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Quantity on hand')),
                const SizedBox(height: 12),
                TextField(controller: minCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Minimum level')),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              await db.into(db.inventoryItems).insert(
                    InventoryItemsCompanion.insert(
                      id: const Uuid().v4(),
                      itemCode: codeCtrl.text.trim(),
                      itemName: nameCtrl.text.trim(),
                      category: categoryCtrl.text.trim(),
                      unit: unitCtrl.text.trim(),
                      unitCost: ((double.tryParse(costCtrl.text.trim()) ?? 0) * 100).round(),
                      quantityOnHand: int.tryParse(qtyCtrl.text.trim()) ?? 0,
                      minimumLevel: int.tryParse(minCtrl.text.trim()) ?? 0,
                    ),
                  );
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}

class _PurchasesTab extends StatelessWidget {
  const _PurchasesTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InventoryPurchase>>(
      stream: db.select(db.inventoryPurchases).watch(),
      builder: (context, snapshot) {
        final purchases = snapshot.data ?? const <InventoryPurchase>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Recent Purchases',
            action: ElevatedButton.icon(onPressed: () => _showRecordPurchaseDialog(context, db), icon: const Icon(Icons.shopping_cart_rounded), label: const Text('Record Purchase')),
            child: purchases.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No purchases recorded yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 700,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Supplier')), DataColumn(label: Text('Qty')), DataColumn(label: Text('Cost')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final p in purchases)
                          DataRow(cells: [
                            DataCell(Text(p.supplierName)),
                            DataCell(Text('${p.quantity}')),
                            DataCell(Text(formatInr(p.totalCost))),
                            DataCell(StatusBadge(p.status, tone: StatusTone.success)),
                          ]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Future<void> _showRecordPurchaseDialog(BuildContext context, BusinessDatabase db) async {
    final items = await db.select(db.inventoryItems).get();
    if (items.isEmpty) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add an item first.')));
      return;
    }
    InventoryItem selected = items.first;
    final supplierCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();

    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Record Purchase'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<InventoryItem>(
                  initialValue: selected,
                  decoration: const InputDecoration(labelText: 'Item'),
                  items: [for (final i in items) DropdownMenuItem(value: i, child: Text(i.itemName))],
                  onChanged: (v) => setState(() => selected = v ?? items.first),
                ),
                const SizedBox(height: 12),
                TextField(controller: supplierCtrl, decoration: const InputDecoration(labelText: 'Supplier name')),
                const SizedBox(height: 12),
                TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Quantity')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                final qty = int.tryParse(qtyCtrl.text.trim()) ?? 0;
                if (qty <= 0) return;
                final totalCost = qty * selected.unitCost;
                await db.into(db.inventoryPurchases).insert(
                      InventoryPurchasesCompanion.insert(
                        id: const Uuid().v4(),
                        itemId: selected.id,
                        supplierName: supplierCtrl.text.trim(),
                        purchaseDate: DateTime.now(),
                        quantity: qty,
                        unitCost: selected.unitCost,
                        totalCost: totalCost,
                      ),
                    );
                await (db.update(db.inventoryItems)..where((t) => t.id.equals(selected.id)))
                    .write(InventoryItemsCompanion(quantityOnHand: drift.Value(selected.quantityOnHand + qty)));
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Record'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdjustmentsTab extends StatelessWidget {
  const _AdjustmentsTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InventoryAdjustment>>(
      stream: db.select(db.inventoryAdjustments).watch(),
      builder: (context, snapshot) {
        final adjustments = snapshot.data ?? const <InventoryAdjustment>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Inventory Adjustments',
            child: adjustments.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No adjustments recorded yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 600,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Type')), DataColumn(label: Text('Qty Δ')), DataColumn(label: Text('Reason'))],
                      rows: [
                        for (final a in adjustments)
                          DataRow(cells: [DataCell(Text(a.adjustmentType)), DataCell(Text('${a.quantityDelta}')), DataCell(Text(a.reason))]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class _AlertsTab extends StatelessWidget {
  const _AlertsTab({required this.db});
  final BusinessDatabase db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InventoryItem>>(
      stream: db.select(db.inventoryItems).watch(),
      builder: (context, snapshot) {
        final lowStock = (snapshot.data ?? const <InventoryItem>[]).where((i) => i.quantityOnHand <= i.minimumLevel).toList();
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Low Stock Alerts',
            child: lowStock.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('Nothing below minimum level.', style: TextStyle(color: AppColors.navySoft)))
                : Column(
                    children: [
                      for (final i in lowStock)
                        ListTile(
                          leading: const Icon(Icons.warning_amber_rounded, color: AppColors.warning),
                          title: Text(i.itemName),
                          subtitle: Text('Qty: ${i.quantityOnHand} ${i.unit}  ·  Min: ${i.minimumLevel} ${i.unit}'),
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
