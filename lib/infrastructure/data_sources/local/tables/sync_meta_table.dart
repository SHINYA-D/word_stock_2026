import 'package:sqflite/sqflite.dart';

class SyncMetaTable {
  static const String tableName = 'sync_meta';

  static Future<void> onCreate(DatabaseExecutor db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');
  }
}
