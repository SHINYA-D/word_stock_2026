import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:word_stock_2026/core/error/failure.dart';
import 'package:word_stock_2026/domain/entities/test_result.dart';
import 'package:word_stock_2026/domain/repositories/test_result_repository.dart';
import 'package:word_stock_2026/infrastructure/data_sources/firestore_data_source.dart';

class TestResultRepositoryImpl implements TestResultRepository {
  TestResultRepositoryImpl(this._dataSource);

  final FirestoreDataSource _dataSource;

  @override
  Future<Either<Failure, List<TestResult>>> getTestResults({
    required String userId,
  }) async {
    try {
      final data = await _dataSource.getTestResults(
        userId: userId,
      );
      return Right(data.map(_fromMap).toList());
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TestResult>> saveTestResult({
    required String userId,
    required String folderId,
    required int totalCount,
    required int correctCount,
  }) async {
    try {
      final data = await _dataSource.saveTestResult(
        userId: userId,
        folderId: folderId,
        totalCount: totalCount,
        correctCount: correctCount,
      );
      return Right(_fromMap(data));
    } on FirebaseException catch (e) {
      return Left(_mapException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  TestResult _fromMap(Map<String, dynamic> map) {
    final date = map['date'];
    return TestResult(
      id: map['id'] as String,
      folderId: map['folderId'] as String,
      totalCount: map['totalCount'] as int,
      correctCount: map['correctCount'] as int,
      date: date is Timestamp ? date.toDate() : DateTime.now(),
    );
  }

  Failure _mapException(FirebaseException e) {
    if (e.code == 'unavailable' || e.code == 'network-request-failed') {
      return const Failure.network();
    }
    return Failure.unknown(e.message ?? e.code);
  }
}
