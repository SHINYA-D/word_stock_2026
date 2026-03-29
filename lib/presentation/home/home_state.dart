import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/folder.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required AsyncValue<List<Folder>> folders,
  }) = _HomeState;

  factory HomeState.loading() => const HomeState(folders: AsyncValue.loading());
}
