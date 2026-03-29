import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/repositories/word_repository.dart';

class DeleteWordUseCase {
  const DeleteWordUseCase(this._repository);

  final WordRepository _repository;

  Future<Either<Failure, Unit>> call({
    required String userId,
    required String folderId,
    required String wordId,
  }) {
    return _repository.deleteWord(
      userId: userId,
      folderId: folderId,
      wordId: wordId,
    );
  }
}
