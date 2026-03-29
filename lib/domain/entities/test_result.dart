import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_result.freezed.dart';

@freezed
abstract class TestResult with _$TestResult {
  const factory TestResult({
    required String id,
    required String folderId,
    required int totalCount,
    required int correctCount,
    required DateTime date,
  }) = _TestResult;

  const TestResult._();

  double get correctRate =>
      totalCount == 0 ? 0 : correctCount / totalCount;
}
