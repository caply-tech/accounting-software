import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/db/seed_data.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameCtrl = TextEditingController(text: 'admin');
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final databases = context.read<AppDatabases>();
      await seedIfEmpty(databases.core, databases.businessDb);

      final username = _usernameCtrl.text.trim().isEmpty ? 'admin' : _usernameCtrl.text.trim();
      final userRow = await (databases.core.select(databases.core.users)..where((u) => u.username.equals(username))).getSingleOrNull();
      if (userRow == null) {
        setState(() => _error = 'No local account with that username.');
        return;
      }

      final roleRows = await databases.core.select(databases.core.userBusinessRoles).get();
      final businessRows = await databases.core.select(databases.core.businesses).get();
      final rolesById = {for (final r in await databases.core.select(databases.core.roles).get()) r.id: r.name};
      final myRole = roleRows.where((r) => r.userId == userRow.id).firstOrNull;
      final roleLabel = myRole == null ? 'User' : (rolesById[myRole.roleId] ?? 'User');

      if (!mounted) return;
      final session = context.read<SessionState>();
      session.setBusinesses([
        for (final b in businessRows)
          BusinessSummary(id: b.id, name: b.name, businessType: b.businessType, location: b.location, isHeadOffice: b.isHeadOffice, dbFilename: b.dbFilename),
      ]);
      session.signIn(CurrentUser(id: userRow.id, fullName: userRow.fullName, roleLabel: roleLabel));

      await databases.core.update(databases.core.users).replace(userRow.copyWith(lastLoginAt: Value(DateTime.now())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: 440,
            padding: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 24, offset: const Offset(0, 8))],
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
                  ),
                  child: const Icon(Icons.show_chart_rounded, color: Colors.white, size: 32),
                ),
                const SizedBox(height: 16),
                const Text('Accounting Management Software', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.navy)),
                const SizedBox(height: 6),
                const Text('Professional Accounting & Business Management Solution', textAlign: TextAlign.center, style: TextStyle(fontSize: 12.5, color: AppColors.navySoft)),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 20),
                const Align(alignment: Alignment.centerLeft, child: Text('Sign in to your account', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700))),
                const SizedBox(height: 4),
                const Align(alignment: Alignment.centerLeft, child: Text('Enter your credentials to access your account', style: TextStyle(fontSize: 12.5, color: AppColors.navySoft))),
                const SizedBox(height: 20),
                Align(alignment: Alignment.centerLeft, child: const Text('Username / Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                const SizedBox(height: 6),
                TextField(
                  controller: _usernameCtrl,
                  decoration: const InputDecoration(hintText: 'Enter username or email', prefixIcon: Icon(Icons.person_outline)),
                ),
                const SizedBox(height: 16),
                Align(alignment: Alignment.centerLeft, child: const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                const SizedBox(height: 6),
                TextField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    hintText: 'Enter your password (any value, demo mode)',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  onSubmitted: (_) => _signIn(),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Align(alignment: Alignment.centerLeft, child: Text(_error!, style: const TextStyle(color: AppColors.critical, fontSize: 12.5))),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _signIn,
                    child: _loading
                        ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Sign In', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.border)),
                  child: Row(
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Offline Mode', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                            Text('This application operates locally on your device.\nNo internet connection is required.', style: TextStyle(fontSize: 11.5, color: AppColors.navySoft)),
                          ],
                        ),
                      ),
                      const Icon(Icons.wifi_off_rounded, color: AppColors.success),
                    ],
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
