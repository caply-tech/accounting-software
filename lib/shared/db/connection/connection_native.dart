import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart' as sqlite3_libs;

/// Opens (or creates) [fileName] under the app's local application-support
/// directory, e.g. `AccountingSoftware/core.db` or
/// `AccountingSoftware/businesses/biz_<id>.db`.
///
/// SQLCipher encryption (see docs/database-architecture.md) is layered on
/// top of this connection in `EncryptedNativeDatabase` once a master
/// password exists — left as a follow-up so the schema can be exercised
/// end-to-end first; wiring it in does not change any table definition.
QueryExecutor openConnection(String fileName) {
  return LazyDatabase(() async {
    sqlite3_libs.applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    final dir = await getApplicationSupportDirectory();
    final dbDir = Directory(p.join(dir.path, 'AccountingSoftware'));
    if (!await dbDir.exists()) {
      await dbDir.create(recursive: true);
    }
    final file = File(p.join(dbDir.path, fileName));
    return NativeDatabase.createInBackground(file);
  });
}
