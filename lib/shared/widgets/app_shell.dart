import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/accounts_finance/accounts_finance_screen.dart';
import '../../modules/asset_valuation/asset_valuation_screen.dart';
import '../../modules/calendar/calendar_screen.dart';
import '../../modules/dashboard/dashboard_screen.dart';
import '../../modules/inventory/inventory_screen.dart';
import '../../modules/multi_branch/multi_branch_screen.dart';
import '../../modules/payroll_staff/payroll_staff_screen.dart';
import '../../modules/reports/reports_screen.dart';
import '../../modules/security_admin/security_admin_screen.dart';
import '../state/session.dart';
import 'app_sidebar.dart';
import 'app_topbar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.watch<SessionState>();
    final (title, subtitle, body) = switch (session.module) {
      AppModule.dashboard => ('Dashboard', "Welcome back, ${session.user?.fullName ?? ''}! Here's what's happening with your business.", const DashboardScreen()),
      AppModule.accountsFinance => ('Accounts & Finance', 'Chart of accounts, ledger, invoices and bank reconciliation', const AccountsFinanceScreen()),
      AppModule.multiBranch => ('Multi-Branch / Company', 'Manage independent businesses from one software installation', const MultiBranchScreen()),
      AppModule.payrollStaff => ('Payroll & Staff', 'Manage employees, attendance, leave, payroll and employment records', const PayrollStaffScreen()),
      AppModule.assetValuation => ('Asset & Valuation', 'Track fixed assets, depreciation schedules and valuations', const AssetValuationScreen()),
      AppModule.inventory => ('Inventory Management', 'Manage stock, purchases, consumables and low-stock alerts', const InventoryScreen()),
      AppModule.eventCalendar => ('Event & Calendar', 'Manage meetings, schedules and boardroom bookings', const CalendarScreen()),
      AppModule.reports => ('Reports', 'Generate financial, payroll, asset and inventory reports', const ReportsScreen()),
      AppModule.securityAdmin => ('Security & Admin', 'Manage users, roles, access control, audit activity and local backup', const SecurityAdminScreen()),
    };

    return Scaffold(
      body: Row(
        children: [
          AppSidebar(selected: session.module, onSelect: session.setModule),
          Expanded(
            child: Column(
              children: [
                AppTopBar(
                  title: title,
                  subtitle: subtitle,
                  businesses: session.businesses,
                  currentBusiness: session.currentBusiness,
                  onSwitchBusiness: session.switchBusiness,
                  user: session.user,
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF8FAFC),
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(child: body),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
