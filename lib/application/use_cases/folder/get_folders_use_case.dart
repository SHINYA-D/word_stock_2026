import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/folder.dart';
import 'package:word_stock_2026/domain/repositories/folder_repository.dart';

class GetFoldersUseCase {
  const GetFoldersUseCase(this._repository);

  final FolderRepository _repository;

  Future<Either<Failure, List<Folder>>> call({
    required String userId,
  }) {
    return _repository.getFolders(
      userId: userId,
    );
  }
}
