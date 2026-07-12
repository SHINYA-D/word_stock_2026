import 'package:sqflite/sqflite.dart';

class WordTable {
  static const String tableName = 'words';

  static Future<void> onCreate(DatabaseExecutor db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id TEXT PRIMARY KEY,
        front TEXT NOT NULL,
        back TEXT NOT NULL,
        folderId TEXT NOT NULL,
        userId TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        syncStatus TEXT NOT NULL DEFAULT 'synced'
      )
    ''');
  }
}
