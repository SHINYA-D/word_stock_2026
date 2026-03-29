import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/word.dart';
import 'package:word_stock_2026/domain/repositories/word_repository.dart';
import 'package:word_stock_2026/infrastructure/data_sources/firestore_data_source.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl(this._dataSource);

  final FirestoreDataSource _dataSource;

  @override
  Future<Either<Failure, List<Word>>> getWords({
    required String userId,
    required String folderId,
  }) async {
    try {
      final data =
          await _dataSource.getWords(userId: userId, folderId: folderId);
      return Right(data.map(_fromMap).toList());
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Word>> createWord({
    required String userId,
    required String folderId,
    required String front,
    required String back,
  }) async {
    try {
      final data = await _dataSource.createWord(
        userId: userId,
        folderId: folderId,
        front: front,
        back: back,
      );
      return Right(_fromMap(data));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Word>> updateWord({
    required String userId,
    required String folderId,
    required String wordId,
    required String front,
    required String back,
  }) async {
    try {
      final data = await _dataSource.updateWord(
        userId: userId,
        folderId: folderId,
        wordId: wordId,
        front: front,
        back: back,
      );
      return Right(_fromMap(data));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteWord({
    required String userId,
    required String folderId,
    required String wordId,
  }) async {
    try {
      await _dataSource.deleteWord(
        userId: userId,
        folderId: folderId,
        wordId: wordId,
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  Word _fromMap(Map<String, dynamic> map) {
    final createdAt = map['createdAt'];
    return Word(
      id: map['id'] as String,
      front: map['front'] as String,
      back: map['back'] as String,
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
