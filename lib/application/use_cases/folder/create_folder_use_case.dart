import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/folder.dart';
import 'package:word_stock_2026/domain/repositories/folder_repository.dart';

class CreateFolderUseCase {
  const CreateFolderUseCase(this._repository);

  final FolderRepository _repository;

  Future<Either<Failure, Folder>> call({
    required String userId,
    required String name,
    String? parentFolderId,
  }) {
    return _repository.createFolder(
      userId: userId,
      name: name,
      parentFolderId: parentFolderId,
    );
  }
}
