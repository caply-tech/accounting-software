import 'package:drift/drift.dart' show OrderingTerm;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/stat_card.dart';
import '../../shared/widgets/format.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.watch<SessionState>();
    final business = session.currentBusiness;
    if (business == null) {
      return const Center(child: Text('No business selected. Open Multi-Branch / Company to add one.'));
    }
    final db = context.watch<AppDatabases>().businessDb(business.dbFilename);

    return FutureBuilder<_DashboardData>(
      future: _loadDashboardData(db),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Padding(padding: EdgeInsets.all(40), child: Center(child: CircularProgressIndicator()));
        }
        final data = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 2.2,
              children: [
                StatCard(label: 'Total Income', value: formatInr(data.totalIncome), icon: Icons.trending_up_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg, trend: '18.6%'),
                StatCard(label: 'Total Expenses', value: formatInr(data.totalExpenses), icon: Icons.trending_down_rounded, iconColor: AppColors.critical, iconBg: AppColors.criticalBg, trend: '9.3%', trendUp: false),
                StatCard(label: 'Bank & Cash Balance', value: formatInr(data.bankBalance), icon: Icons.account_balance_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg, trend: '12.4%'),
                StatCard(label: 'Investments', value: formatInr(data.investments), icon: Icons.pie_chart_rounded, iconColor: AppColors.warning, iconBg: AppColors.warningBg, trend: '5.7%'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: SectionCard(title: 'Income vs Expenses', child: _incomeExpenseChart(data))),
                const SizedBox(width: 16),
                Expanded(flex: 2, child: SectionCard(title: 'Recent Notifications', child: _notificationsList(data))),
              ],
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: 'Recent Transactions',
              child: SizedBox(
                width: 760,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Amount (₹)')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    for (final t in data.recentTransactions)
                      DataRow(cells: [
                        DataCell(Text(formatDate(t.txnDate))),
                        DataCell(Text(t.description)),
                        DataCell(Text(t.category)),
                        DataCell(Text(formatInr(t.amount))),
                        DataCell(StatusBadge(
                          t.status[0].toUpperCase() + t.status.substring(1),
                          tone: t.status == 'completed' ? StatusTone.success : StatusTone.warning,
                        )),
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

  Widget _incomeExpenseChart(_DashboardData data) {
    return SizedBox(
      height: 220,
      width: 520,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          gridData: const FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const labels = ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'];
                  final i = value.toInt();
                  return Text(i >= 0 && i < labels.length ? labels[i] : '', style: const TextStyle(fontSize: 11));
                },
              ),
            ),
          ),
          barGroups: [
            for (var i = 0; i < 6; i++)
              BarChartGroupData(x: i, barRods: [
                BarChartRodData(toY: (data.totalIncome / 100000) * (0.7 + 0.05 * i), color: AppColors.primary, width: 10, borderRadius: BorderRadius.circular(3)),
                BarChartRodData(toY: (data.totalExpenses / 100000) * (0.6 + 0.04 * i), color: AppColors.info, width: 10, borderRadius: BorderRadius.circular(3)),
              ]),
          ],
        ),
      ),
    );
  }

  Widget _notificationsList(_DashboardData data) {
    if (data.notifications.isEmpty) {
      return const SizedBox(width: 300, child: Text('No notifications.', style: TextStyle(color: AppColors.navySoft)));
    }
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final n in data.notifications)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    n.severity == 'critical' ? Icons.error_rounded : (n.severity == 'warning' ? Icons.warning_rounded : Icons.info_rounded),
                    size: 16,
                    color: n.severity == 'critical' ? AppColors.critical : (n.severity == 'warning' ? AppColors.warning : AppColors.info),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(n.message, style: const TextStyle(fontSize: 13))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _DashboardData {
  _DashboardData({
    required this.totalIncome,
    required this.totalExpenses,
    required this.bankBalance,
    required this.investments,
    required this.recentTransactions,
    required this.notifications,
  });

  final int totalIncome;
  final int totalExpenses;
  final int bankBalance;
  final int investments;
  final List<Transaction> recentTransactions;
  final List<({String message, String severity})> notifications;
}

Future<_DashboardData> _loadDashboardData(BusinessDatabase db) async {
  final txns = await (db.select(db.transactions)
        ..orderBy([(t) => OrderingTerm.desc(t.txnDate)])
        ..limit(6))
      .get();
  final allTxns = await db.select(db.transactions).get();
  final income = allTxns.where((t) => t.direction == 'credit').fold<int>(0, (sum, t) => sum + t.amount);
  final expenses = allTxns.where((t) => t.direction == 'debit').fold<int>(0, (sum, t) => sum + t.amount);
  final bankAccounts = await db.select(db.bankAccounts).get();
  final bankBalance = bankAccounts.fold<int>(0, (sum, a) => sum + a.currentBalance);
  final assets = await db.select(db.assets).get();
  final investments = assets.fold<int>(0, (sum, a) => sum + a.purchaseCost);

  return _DashboardData(
    totalIncome: income,
    totalExpenses: expenses,
    bankBalance: bankBalance,
    investments: investments,
    recentTransactions: txns,
    notifications: const [
      (message: 'Purchase order is pending approval', severity: 'warning'),
      (message: 'Petty cash balance is low', severity: 'warning'),
      (message: 'Marketing budget exceeded this month', severity: 'critical'),
    ],
  );
}
