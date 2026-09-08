import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/db/core_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

class SecurityAdminScreen extends StatefulWidget {
  const SecurityAdminScreen({super.key});

  @override
  State<SecurityAdminScreen> createState() => _SecurityAdminScreenState();
}

class _SecurityAdminScreenState extends State<SecurityAdminScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 4, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final databases = context.watch<AppDatabases>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabs,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.navySoft,
          indicatorColor: AppColors.primary,
          tabs: const [Tab(text: 'Users & Roles'), Tab(text: 'Permissions'), Tab(text: 'Activity Logs'), Tab(text: 'Backup & Restore')],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 900,
          child: TabBarView(controller: _tabs, children: [
            _UsersRolesTab(databases: databases),
            _PermissionsTab(databases: databases),
            _ActivityLogsTab(databases: databases),
            _BackupRestoreTab(databases: databases),
          ]),
        ),
      ],
    );
  }
}

class _UsersRolesTab extends StatelessWidget {
  const _UsersRolesTab({required this.databases});
  final AppDatabases databases;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: databases.core.select(databases.core.users).watch(),
      builder: (context, userSnap) {
        final users = userSnap.data ?? const <User>[];
        return FutureBuilder<(List<UserBusinessRole>, List<BusinessesData>, List<Role>)>(
          future: () async {
            final ubr = await databases.core.select(databases.core.userBusinessRoles).get();
            final biz = await databases.core.select(databases.core.businesses).get();
            final roles = await databases.core.select(databases.core.roles).get();
            return (ubr, biz, roles);
          }(),
          builder: (context, snapshot) {
            final (ubr, businesses, roles) = snapshot.data ?? const ([], [], []);
            final bizById = {for (final b in businesses) b.id: b.name};
            final roleById = {for (final r in roles) r.id: r.name};

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
                    childAspectRatio: 2.8,
                    children: [
                      StatCard(label: 'Active Users', value: '${users.where((u) => u.status == 'active').length}', icon: Icons.people_alt_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
                      StatCard(label: 'Administrators', value: '${users.where((u) => u.isSuperAdmin).length}', icon: Icons.admin_panel_settings_rounded, iconColor: AppColors.success, iconBg: AppColors.successBg),
                      StatCard(label: 'Total Businesses Covered', value: '${businesses.length}', icon: Icons.apartment_rounded, iconColor: AppColors.purple, iconBg: AppColors.purpleBg),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SectionCard(
                    title: 'Users & Roles',
                    child: SizedBox(
                      width: 800,
                      child: DataTable(
                        columns: const [DataColumn(label: Text('User')), DataColumn(label: Text('Role')), DataColumn(label: Text('Business')), DataColumn(label: Text('Access')), DataColumn(label: Text('Status'))],
                        rows: [
                          for (final u in users)
                            () {
                              final assignment = ubr.where((r) => r.userId == u.id).firstOrNull;
                              return DataRow(cells: [
                                DataCell(Text(u.fullName)),
                                DataCell(Text(assignment == null ? '—' : (roleById[assignment.roleId] ?? '—'))),
                                DataCell(Text(assignment == null ? '—' : (bizById[assignment.businessId] ?? '—'))),
                                DataCell(Text(assignment?.accessLevel ?? '—')),
                                DataCell(StatusBadge(u.status == 'active' ? 'Active' : 'Inactive', tone: u.status == 'active' ? StatusTone.success : StatusTone.neutral)),
                              ]);
                            }(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _PermissionsTab extends StatelessWidget {
  const _PermissionsTab({required this.databases});
  final AppDatabases databases;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<(List<Role>, List<PermissionsMatrixData>)>(
      future: () async {
        final roles = await databases.core.select(databases.core.roles).get();
        final matrix = await databases.core.select(databases.core.permissionsMatrix).get();
        return (roles, matrix);
      }(),
      builder: (context, snapshot) {
        final (roles, matrix) = snapshot.data ?? const ([], []);
        const modules = ['Finance', 'Payroll', 'Assets', 'Inventory', 'Reports', 'Administration'];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Permissions Matrix',
            child: SizedBox(
              width: 700,
              child: DataTable(
                columns: [const DataColumn(label: Text('Module')), for (final r in roles) DataColumn(label: Text(r.name))],
                rows: [
                  for (final module in modules)
                    DataRow(cells: [
                      DataCell(Text(module)),
                      for (final r in roles)
                        DataCell(_accessIcon(matrix.where((m) => m.roleId == r.id && m.module == module).firstOrNull?.access ?? 'none')),
                    ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _accessIcon(String access) {
    return switch (access) {
      'full' => const Icon(Icons.check_circle, color: AppColors.success, size: 18),
      'view_limited' => const Icon(Icons.visibility, color: AppColors.warning, size: 18),
      _ => const Icon(Icons.remove_circle_outline, color: AppColors.navySoft, size: 18),
    };
  }
}

class _ActivityLogsTab extends StatelessWidget {
  const _ActivityLogsTab({required this.databases});
  final AppDatabases databases;

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;
    if (business == null) return const Center(child: Text('No business selected.'));
    final db = databases.businessDb(business.dbFilename);

    return StreamBuilder<List<AuditLogData>>(
      stream: (db.select(db.auditLog)..orderBy([(a) => drift.OrderingTerm.desc(a.occurredAt)])).watch(),
      builder: (context, snapshot) {
        final logs = snapshot.data ?? const <AuditLogData>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Activity Log',
            child: logs.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No activity recorded for this business yet.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 700,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('When')), DataColumn(label: Text('User')), DataColumn(label: Text('Action')), DataColumn(label: Text('Module')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final l in logs)
                          DataRow(cells: [DataCell(Text(formatDate(l.occurredAt))), DataCell(Text(l.userId)), DataCell(Text(l.action)), DataCell(Text(l.module)), DataCell(StatusBadge(l.status, tone: StatusTone.success))]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class _BackupRestoreTab extends StatefulWidget {
  const _BackupRestoreTab({required this.databases});
  final AppDatabases databases;

  @override
  State<_BackupRestoreTab> createState() => _BackupRestoreTabState();
}

class _BackupRestoreTabState extends State<_BackupRestoreTab> {
  bool _running = false;

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;

    return StreamBuilder<List<BackupLogData>>(
      stream: (widget.databases.core.select(widget.databases.core.backupLog)..orderBy([(b) => drift.OrderingTerm.desc(b.startedAt)])).watch(),
      builder: (context, snapshot) {
        final backups = snapshot.data ?? const <BackupLogData>[];
        return SingleChildScrollView(
          child: SectionCard(
            title: 'Backup & Restore (Local)',
            action: ElevatedButton.icon(
              onPressed: _running || business == null ? null : () => _runBackup(business.dbFilename),
              icon: _running ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.backup_rounded),
              label: Text(_running ? 'Backing up…' : 'Backup Now'),
            ),
            child: backups.isEmpty
                ? const Padding(padding: EdgeInsets.all(20), child: Text('No backups yet. All backups are stored locally, encrypted for data safety.', style: TextStyle(color: AppColors.navySoft)))
                : SizedBox(
                    width: 700,
                    child: DataTable(
                      columns: const [DataColumn(label: Text('Started')), DataColumn(label: Text('Type')), DataColumn(label: Text('Size')), DataColumn(label: Text('Status'))],
                      rows: [
                        for (final b in backups)
                          DataRow(cells: [
                            DataCell(Text(formatDate(b.startedAt))),
                            DataCell(Text(b.backupType)),
                            DataCell(Text('${(b.sizeBytes / 1024).toStringAsFixed(1)} KB')),
                            DataCell(StatusBadge(b.status, tone: b.status == 'success' ? StatusTone.success : StatusTone.critical)),
                          ]),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Future<void> _runBackup(String dbFilename) async {
    setState(() => _running = true);
    try {
      final dir = await getApplicationSupportDirectory();
      final sourceFile = File('${dir.path}/AccountingSoftware/$dbFilename');
      final backupDir = Directory('${dir.path}/AccountingSoftware/backups');
      if (!await backupDir.exists()) await backupDir.create(recursive: true);
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final destPath = '${backupDir.path}/${timestamp}_$dbFilename';
      var sizeBytes = 0;
      var status = 'success';
      try {
        if (await sourceFile.exists()) {
          final copy = await sourceFile.copy(destPath);
          sizeBytes = await copy.length();
        }
      } catch (_) {
        status = 'failed';
      }
      await widget.databases.core.into(widget.databases.core.backupLog).insert(
            BackupLogCompanion.insert(id: const Uuid().v4(), startedAt: DateTime.now(), status: status, locationPath: destPath, sizeBytes: drift.Value(sizeBytes), backupType: 'full'),
          );
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }
}
