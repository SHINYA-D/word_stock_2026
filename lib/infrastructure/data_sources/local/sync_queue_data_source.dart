import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'tables/sync_queue_table.dart';

class SyncQueueDataSource {
  SyncQueueDataSource(this._dbHelper);

  final DatabaseHelper _dbHelper;

  /// キューに追加（単体使用時）
  Future<void> enqueue({
    required String operation,
    required String tableName,
    required String recordId,
    String? parentId,
    Map<String, dynamic>? payload,
  }) async {
    final db = await _dbHelper.database;
    await db.insert(SyncQueueTable.tableName, {
      'operation': operation,
      'table_name': tableName,
      'record_id': recordId,
      'parent_id': parentId,
      'payload': payload != null ? jsonEncode(payload) : null,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  /// トランザクション内でキューに追加（データ書き込みと同時実行時に使用）
  Future<void> enqueueInTransaction(
    Transaction txn, {
    required String operation,
    required String tableName,
    required String recordId,
    String? parentId,
    Map<String, dynamic>? payload,
  }) async {
    await txn.insert(SyncQueueTable.tableName, {
      'operation': operation,
      'table_name': tableName,
      'record_id': recordId,
      'parent_id': parentId,
      'payload': payload != null ? jsonEncode(payload) : null,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  /// キューから古い順に全件取得
  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await _dbHelper.database;
    return await db.query(
      SyncQueueTable.tableName,
      orderBy: 'created_at ASC',
    );
  }

  /// 特定のキューを削除（同期成功時）
  Future<void> delete(int id) async {
    final db = await _dbHelper.database;
    await db.delete(
      SyncQueueTable.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// キュー件数を取得
  Future<int> count() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${SyncQueueTable.tableName}',
    );
    return result.first['count'] as int;
  }
}
