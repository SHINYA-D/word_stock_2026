import 'dart:developer' show log;

import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/app_user.dart';
import 'package:word_stock_2026/domain/repositories/auth_repository.dart';
import 'package:word_stock_2026/infrastructure/sync/sync_service.dart';

class SignInWithGoogleUseCase {
  const SignInWithGoogleUseCase(this._repository, this._syncService);

  final AuthRepository _repository;
  final SyncService _syncService;

  Future<Either<Failure, AppUser>> call() async {
    final result = await _repository.signInWithGoogle();
    await result.fold(
      (_) async {},
      (_) async {
        try {
          await _syncService.syncRemoteToLocalOnLogin();
        } catch (e, stack) {
          log('syncRemoteToLocalOnLogin failed: $e\n$stack');
        }
      },
    );
    return result;
  }
}
