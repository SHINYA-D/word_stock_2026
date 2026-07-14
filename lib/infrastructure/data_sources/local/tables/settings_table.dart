import 'package:sqflite/sqflite.dart';

class SettingsTable {
  static const String tableName = 'settings';

  static Future<void> onCreate(DatabaseExecutor db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        userId TEXT PRIMARY KEY,
        colorTheme TEXT NOT NULL DEFAULT 'indigo',
        darkMode INTEGER NOT NULL DEFAULT 0,
        updatedAt TEXT NOT NULL,
        syncStatus TEXT NOT NULL DEFAULT 'synced'
      )
    ''');
  }
}
