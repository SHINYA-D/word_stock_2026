import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/user_settings.dart';
import 'package:word_stock_2026/domain/repositories/settings_repository.dart';
import 'package:word_stock_2026/infrastructure/data_sources/firestore_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._dataSource);

  final FirestoreDataSource _dataSource;

  @override
  Future<Either<Failure, UserSettings>> getSettings({
    required String userId,
  }) async {
    try {
      final data = await _dataSource.getSettings(userId: userId);
      if (data == null) return const Right(UserSettings());
      return Right(UserSettings(
        colorTheme: (data['colorTheme'] as String?) ?? 'indigo',
        darkMode: (data['darkMode'] as bool?) ?? false,
      ));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateSettings({
    required String userId,
    required UserSettings settings,
  }) async {
    try {
      await _dataSource.updateSettings(
        userId: userId,
        data: {
          'colorTheme': settings.colorTheme,
          'darkMode': settings.darkMode,
        },
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  Failure _mapException(FirebaseException e) {
    if (e.code == 'unavailable' || e.code == 'network-request-failed') {
      return const Failure.network();
    }
    return Failure.unknown(e.message ?? e.code);
  }
}
