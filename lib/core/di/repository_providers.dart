import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_stock_2026/core/di/firebase_providers.dart';
import 'package:word_stock_2026/domain/repositories/auth_repository.dart';
import 'package:word_stock_2026/domain/repositories/folder_repository.dart';
import 'package:word_stock_2026/domain/repositories/settings_repository.dart';
import 'package:word_stock_2026/domain/repositories/test_result_repository.dart';
import 'package:word_stock_2026/domain/repositories/word_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/auth_repository_impl.dart';
import 'package:word_stock_2026/infrastructure/repositories/folder_repository_impl.dart';
import 'package:word_stock_2026/infrastructure/repositories/mock/mock_auth_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/mock/mock_folder_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/mock/mock_settings_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/mock/mock_test_result_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/mock/mock_word_repository.dart';
import 'package:word_stock_2026/infrastructure/repositories/settings_repository_impl.dart';
import 'package:word_stock_2026/infrastructure/repositories/test_result_repository_impl.dart';
import 'package:word_stock_2026/infrastructure/repositories/word_repository_impl.dart';

part 'repository_providers.g.dart';

// ---------------------------------------------------------------
// モード切り替えフラグ
// ---------------------------------------------------------------
const kUseMocks = bool.fromEnvironment('USE_MOCKS', defaultValue: false);

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  if (kUseMocks) return MockAuthRepository();
  return AuthRepositoryImpl(ref.watch(firebaseAuthDataSourceProvider));
}

@Riverpod(keepAlive: true)
FolderRepository folderRepository(Ref ref) {
  if (kUseMocks) return MockFolderRepository();
  return FolderRepositoryImpl(ref.watch(firestoreDataSourceProvider));
}

@Riverpod(keepAlive: true)
WordRepository wordRepository(Ref ref) {
  if (kUseMocks) return MockWordRepository();
  return WordRepositoryImpl(ref.watch(firestoreDataSourceProvider));
}

@Riverpod(keepAlive: true)
TestResultRepository testResultRepository(Ref ref) {
  if (kUseMocks) return MockTestResultRepository();
  return TestResultRepositoryImpl(ref.watch(firestoreDataSourceProvider));
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  if (kUseMocks) return MockSettingsRepository();
  return SettingsRepositoryImpl(ref.watch(firestoreDataSourceProvider));
}
