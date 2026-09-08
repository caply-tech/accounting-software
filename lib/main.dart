import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/auth/login_screen.dart';
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

class _RootRouter extends StatelessWidget {
  const _RootRouter();

  @override
  Widget build(BuildContext context) {
    final session = context.watch<SessionState>();
    return session.isSignedIn ? const AppShell() : const LoginScreen();
  }
}
