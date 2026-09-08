import 'package:flutter/material.dart';

import '../state/session.dart';
import '../theme/app_theme.dart';

class _NavItem {
  const _NavItem(this.module, this.icon, this.label);
  final AppModule module;
  final IconData icon;
  final String label;
}

const _navItems = [
  _NavItem(AppModule.dashboard, Icons.home_rounded, 'Dashboard'),
  _NavItem(AppModule.accountsFinance, Icons.account_balance_rounded, 'Accounts & Finance'),
  _NavItem(AppModule.multiBranch, Icons.apartment_rounded, 'Multi-Branch / Company'),
  _NavItem(AppModule.payrollStaff, Icons.groups_rounded, 'Payroll & Staff'),
  _NavItem(AppModule.assetValuation, Icons.inventory_2_rounded, 'Asset & Valuation'),
  _NavItem(AppModule.inventory, Icons.widgets_rounded, 'Inventory Management'),
  _NavItem(AppModule.eventCalendar, Icons.calendar_month_rounded, 'Event & Calendar'),
  _NavItem(AppModule.reports, Icons.description_rounded, 'Reports'),
  _NavItem(AppModule.securityAdmin, Icons.verified_user_rounded, 'Security & Admin'),
];

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key, required this.selected, required this.onSelect});

  final AppModule selected;
  final ValueChanged<AppModule> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(Icons.show_chart_rounded, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Accounting\nManagement Software',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.navy),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                for (final item in _navItems) _SidebarTile(item: item, selected: selected == item.module, onSelect: onSelect),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: _OfflineBadge(),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({required this.item, required this.selected, required this.onSelect});
  final _NavItem item;
  final bool selected;
  final ValueChanged<AppModule> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: selected ? AppColors.primary.withValues(alpha: 0.08) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onSelect(item.module),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: selected ? AppColors.primary : Colors.transparent, width: 3)),
            ),
            child: Row(
              children: [
                Icon(item.icon, size: 20, color: selected ? AppColors.primary : AppColors.navySoft),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: selected ? AppColors.primary : AppColors.navy,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OfflineBadge extends StatelessWidget {
  const _OfflineBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Offline Mode', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
                Text('All systems operational locally on this device.', style: TextStyle(fontSize: 10.5, color: AppColors.navySoft)),
              ],
            ),
          ),
          const Icon(Icons.wifi_off_rounded, size: 16, color: AppColors.success),
        ],
      ),
    );
  }
}
