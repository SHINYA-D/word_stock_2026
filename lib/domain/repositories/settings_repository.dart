import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/user_settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserSettings>> getSettings({
    required String userId,
  });

  Future<Either<Failure, Unit>> updateSettings({
    required String userId,
    required UserSettings settings,
  });
}
