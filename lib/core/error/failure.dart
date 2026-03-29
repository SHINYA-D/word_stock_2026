import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.auth() = AuthFailure;
  const factory Failure.notFound() = NotFoundFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
