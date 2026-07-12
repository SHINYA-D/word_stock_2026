import 'package:sqflite/sqflite.dart';

class SyncQueueTable {
  static const String tableName = 'sync_queue';

  static Future<void> onCreate(DatabaseExecutor db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        operation TEXT NOT NULL,
        table_name TEXT NOT NULL,
        record_id TEXT NOT NULL,
        parent_id TEXT,
        payload TEXT,
        created_at TEXT NOT NULL
      )
    ''');
  }
}
