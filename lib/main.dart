import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/auth/login_screen.dart';
import 'modules/setup/first_run_setup_screen.dart';
import 'shared/state/app_databases.dart';
import 'shared/state/session.dart';
import 'shared/theme/app_theme.dart';
import 'shared/widgets/app_shell.dart';

void main() {
  runApp(const AccountingSoftwareApp());
}

class AccountingSoftwareApp extends StatelessWidget {
  const AccountingSoftwareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionState()),
        ChangeNotifierProvider(create: (_) => AppDatabases()),
      ],
      child: MaterialApp(
        title: 'Accounting Management Software',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const _RootRouter(),
      ),
    );
  }
}

/// Decides, once per app launch, whether this device has ever completed
/// the First-Run Setup Screen (checked via `businesses` being non-empty —
/// that table and `app_settings.setup_mode` are written together in
/// `seedIfEmpty`, so either is a valid signal, but `businesses` is what
/// the rest of the app already queries). Every later launch skips straight
/// past this check to Sign In.
class _RootRouter extends StatefulWidget {
  const _RootRouter();

  @override
  State<_RootRouter> createState() => _RootRouterState();
}

class _RootRouterState extends State<_RootRouter> {
  bool? _needsFirstRunSetup;

  bool _checked = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    if (_checked) return;
    _checked = true;
    final databases = context.read<AppDatabases>();
    final businesses = await databases.core.select(databases.core.businesses).get();
    if (mounted) setState(() => _needsFirstRunSetup = businesses.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    if (_needsFirstRunSetup == null) {
      return const Scaffold(backgroundColor: Color(0xFFF8FAFC), body: Center(child: CircularProgressIndicator()));
    }
    if (_needsFirstRunSetup!) {
      return FirstRunSetupScreen(onComplete: () => setState(() => _needsFirstRunSetup = false));
    }
    final session = context.watch<SessionState>();
    return session.isSignedIn ? const AppShell() : const LoginScreen();
  }
}
