import 'package:flutter/foundation.dart';

import '../db/business_database.dart';
import '../db/core_database.dart';

/// Owns the single [CoreDatabase] connection for the whole app, plus a
/// cache of opened [BusinessDatabase] connections keyed by db filename —
/// each business's file is opened lazily the first time it becomes the
/// active context and kept open after that (switching businesses is then
/// just swapping which cached connection the UI reads from, not a reopen).
class AppDatabases extends ChangeNotifier {
  AppDatabases() : core = CoreDatabase();

  final CoreDatabase core;
  final Map<String, BusinessDatabase> _businessDbs = {};

  BusinessDatabase businessDb(String dbFilename) {
    return _businessDbs.putIfAbsent(dbFilename, () => BusinessDatabase(dbFilename));
  }

  @override
  void dispose() {
    for (final db in _businessDbs.values) {
      db.close();
    }
    core.close();
    super.dispose();
  }
}
