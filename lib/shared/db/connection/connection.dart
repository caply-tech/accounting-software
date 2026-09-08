// Platform-conditional connection opener.
// Native (Windows/macOS/Linux/Android/iOS): a real SQLite file on disk.
// Web: sqlite3 compiled to WebAssembly, persisted via the browser's OPFS
// (falling back to IndexedDB where OPFS isn't available) — see
// docs/database-architecture.md and the "Local data store, per platform"
// section of the technology report for why.
import 'package:drift/drift.dart';

import 'connection_stub.dart'
    if (dart.library.io) 'connection_native.dart'
    if (dart.library.js_interop) 'connection_web.dart' as impl;

QueryExecutor openConnection(String fileName) => impl.openConnection(fileName);
