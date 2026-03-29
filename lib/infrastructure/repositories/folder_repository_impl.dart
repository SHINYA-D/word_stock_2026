import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/folder.dart';
import 'package:word_stock_2026/domain/repositories/folder_repository.dart';
import 'package:word_stock_2026/infrastructure/data_sources/firestore_data_source.dart';

class FolderRepositoryImpl implements FolderRepository {
  FolderRepositoryImpl(this._dataSource);

  final FirestoreDataSource _dataSource;

  @override
  Future<Either<Failure, List<Folder>>> getFolders({
    required String userId,
  }) async {
    try {
      final data = await _dataSource.getFolders(
        userId: userId,
      );
      return Right(data.map((e)=> _fromMap(e)).toList());
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Folder>> createFolder({
    required String userId,
    required String name,
    String? parentFolderId,
  }) async {
    try {
      final data = await _dataSource.createFolder(
        userId: userId,
        name: name,
        parentFolderId: parentFolderId,
      );
      return Right(_fromMap(data));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Folder>> updateFolder({
    required String userId,
    required String folderId,
    required String name,
  }) async {
    try {
      final data = await _dataSource.updateFolder(
        userId: userId,
        folderId: folderId,
        name: name,
      );
      return Right(_fromMap(data));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteFolder({
    required String userId,
    required String folderId,
  }) async {
    try {
      await _dataSource.deleteFolder(userId: userId, folderId: folderId);
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  Folder _fromMap(Map<String, dynamic> map) {
    final createdAt = map['createdAt'];
    return Folder(
      id: map['id'] as String,
      name: map['name'] as String,
      parentFolderId: map['parentFolderId'] as String?,
      createdAt: createdAt is Timestamp ? createdAt.toDate() : DateTime.now(),
    );
  }

  Failure _mapException(FirebaseException e) {
    if (e.code == 'unavailable' || e.code == 'network-request-failed') {
      return const Failure.network();
    }
    return Failure.unknown(e.message ?? e.code);
  }
}
