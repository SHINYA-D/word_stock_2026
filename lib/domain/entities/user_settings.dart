import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default('indigo') String colorTheme,
    @Default(false) bool darkMode,
    DateTime? updatedAt,
  }) = _UserSettings;
}
