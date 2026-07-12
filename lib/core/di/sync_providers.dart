import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_stock_2026/core/di/auth_providers.dart';
import 'package:word_stock_2026/core/di/firebase_providers.dart';
import 'package:word_stock_2026/core/di/local_data_source_providers.dart';
import 'package:word_stock_2026/infrastructure/sync/auto_sync_service.dart';
import 'package:word_stock_2026/infrastructure/sync/sync_service.dart';

part 'sync_providers.g.dart';

@Riverpod(keepAlive: true)
SyncService syncService(Ref ref) {
  return SyncService(
    syncQueueDataSource: ref.watch(syncQueueDataSourceProvider),
    firestore: ref.watch(firestoreProvider),
    getCurrentUserId: () {
      final user = ref.read(currentUserProvider);
      if (user == null) throw StateError('User not logged in');
      return user.id;
    },
    dbHelper: ref.watch(databaseHelperProvider),
  );
}

@Riverpod(keepAlive: true)
AutoSyncService autoSyncService(Ref ref) {
  return AutoSyncService(
    connectivityMonitor: ref.watch(connectivityMonitorProvider),
    syncService: ref.watch(syncServiceProvider),
  );
}
