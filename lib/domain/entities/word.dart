import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';

@freezed
abstract class Word with _$Word {
  const factory Word({
    required String id,
    required String front,
    required String back,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Word;
}
