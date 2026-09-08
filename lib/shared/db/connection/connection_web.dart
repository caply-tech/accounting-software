import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

/// Web build: sqlite3 compiled to WebAssembly. Drift's [WasmDatabase.open]
/// feature-detects the browser's Origin Private File System (OPFS) and
/// falls back to an IndexedDB-backed store automatically where OPFS isn't
/// available (older Safari) — matches the "Local data store, per platform"
/// section of the technology report: the web build reuses the exact same
/// schema and queries as every native build, just backed by WASM SQLite.
QueryExecutor openConnection(String fileName) {
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: fileName,
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );
    return result.resolvedExecutor;
  }));
}
