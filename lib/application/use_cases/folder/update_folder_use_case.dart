import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/folder.dart';
import 'package:word_stock_2026/domain/repositories/folder_repository.dart';

class UpdateFolderUseCase {
  const UpdateFolderUseCase(this._repository);

  final FolderRepository _repository;

  Future<Either<Failure, Folder>> call({
    required String userId,
    required String folderId,
    required String name,
  }) {
    return _repository.updateFolder(
      userId: userId,
      folderId: folderId,
      name: name,
    );
  }
}
