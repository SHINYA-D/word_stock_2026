// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestSessionState {
  bool get isStarted;
  bool get isFinished;
  Word? get currentWord;
  int get currentIndex;
  int get total;
  bool get isFlipped;
  int get correctCount;

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TestSessionStateCopyWith<TestSessionState> get copyWith =>
      _$TestSessionStateCopyWithImpl<TestSessionState>(
          this as TestSessionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TestSessionState &&
            (identical(other.isStarted, isStarted) ||
                other.isStarted == isStarted) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.currentWord, currentWord) ||
                other.currentWord == currentWord) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isFlipped, isFlipped) ||
                other.isFlipped == isFlipped) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isStarted, isFinished,
      currentWord, currentIndex, total, isFlipped, correctCount);

  @override
  String toString() {
    return 'TestSessionState(isStarted: $isStarted, isFinished: $isFinished, currentWord: $currentWord, currentIndex: $currentIndex, total: $total, isFlipped: $isFlipped, correctCount: $correctCount)';
  }
}

/// @nodoc
abstract mixin class $TestSessionStateCopyWith<$Res> {
  factory $TestSessionStateCopyWith(
          TestSessionState value, $Res Function(TestSessionState) _then) =
      _$TestSessionStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isStarted,
      bool isFinished,
      Word? currentWord,
      int currentIndex,
      int total,
      bool isFlipped,
      int correctCount});

  $WordCopyWith<$Res>? get currentWord;
}

/// @nodoc
class _$TestSessionStateCopyWithImpl<$Res>
    implements $TestSessionStateCopyWith<$Res> {
  _$TestSessionStateCopyWithImpl(this._self, this._then);

  final TestSessionState _self;
  final $Res Function(TestSessionState) _then;

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStarted = null,
    Object? isFinished = null,
    Object? currentWord = freezed,
    Object? currentIndex = null,
    Object? total = null,
    Object? isFlipped = null,
    Object? correctCount = null,
  }) {
    return _then(_self.copyWith(
      isStarted: null == isStarted
          ? _self.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _self.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWord: freezed == currentWord
          ? _self.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as Word?,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isFlipped: null == isFlipped
          ? _self.isFlipped
          : isFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      correctCount: null == correctCount
          ? _self.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res>? get currentWord {
    if (_self.currentWord == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_self.currentWord!, (value) {
      return _then(_self.copyWith(currentWord: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TestSessionState].
extension TestSessionStatePatterns on TestSessionState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestSessionState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TestSessionState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestSessionState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TestSessionState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TestSessionState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TestSessionState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isStarted, bool isFinished, Word? currentWord,
            int currentIndex, int total, bool isFlipped, int correctCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TestSessionState() when $default != null:
        return $default(
            _that.isStarted,
            _that.isFinished,
            _that.currentWord,
            _that.currentIndex,
            _that.total,
            _that.isFlipped,
            _that.correctCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isStarted, bool isFinished, Word? currentWord,
            int currentIndex, int total, bool isFlipped, int correctCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TestSessionState():
        return $default(
            _that.isStarted,
            _that.isFinished,
            _that.currentWord,
            _that.currentIndex,
            _that.total,
            _that.isFlipped,
            _that.correctCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isStarted, bool isFinished, Word? currentWord,
            int currentIndex, int total, bool isFlipped, int correctCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TestSessionState() when $default != null:
        return $default(
            _that.isStarted,
            _that.isFinished,
            _that.currentWord,
            _that.currentIndex,
            _that.total,
            _that.isFlipped,
            _that.correctCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TestSessionState implements TestSessionState {
  const _TestSessionState(
      {required this.isStarted,
      required this.isFinished,
      this.currentWord,
      required this.currentIndex,
      required this.total,
      required this.isFlipped,
      required this.correctCount});

  @override
  final bool isStarted;
  @override
  final bool isFinished;
  @override
  final Word? currentWord;
  @override
  final int currentIndex;
  @override
  final int total;
  @override
  final bool isFlipped;
  @override
  final int correctCount;

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TestSessionStateCopyWith<_TestSessionState> get copyWith =>
      __$TestSessionStateCopyWithImpl<_TestSessionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TestSessionState &&
            (identical(other.isStarted, isStarted) ||
                other.isStarted == isStarted) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.currentWord, currentWord) ||
                other.currentWord == currentWord) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isFlipped, isFlipped) ||
                other.isFlipped == isFlipped) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isStarted, isFinished,
      currentWord, currentIndex, total, isFlipped, correctCount);

  @override
  String toString() {
    return 'TestSessionState(isStarted: $isStarted, isFinished: $isFinished, currentWord: $currentWord, currentIndex: $currentIndex, total: $total, isFlipped: $isFlipped, correctCount: $correctCount)';
  }
}

/// @nodoc
abstract mixin class _$TestSessionStateCopyWith<$Res>
    implements $TestSessionStateCopyWith<$Res> {
  factory _$TestSessionStateCopyWith(
          _TestSessionState value, $Res Function(_TestSessionState) _then) =
      __$TestSessionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isStarted,
      bool isFinished,
      Word? currentWord,
      int currentIndex,
      int total,
      bool isFlipped,
      int correctCount});

  @override
  $WordCopyWith<$Res>? get currentWord;
}

/// @nodoc
class __$TestSessionStateCopyWithImpl<$Res>
    implements _$TestSessionStateCopyWith<$Res> {
  __$TestSessionStateCopyWithImpl(this._self, this._then);

  final _TestSessionState _self;
  final $Res Function(_TestSessionState) _then;

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isStarted = null,
    Object? isFinished = null,
    Object? currentWord = freezed,
    Object? currentIndex = null,
    Object? total = null,
    Object? isFlipped = null,
    Object? correctCount = null,
  }) {
    return _then(_TestSessionState(
      isStarted: null == isStarted
          ? _self.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _self.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWord: freezed == currentWord
          ? _self.currentWord
          : currentWord // ignore: cast_nullable_to_non_nullable
              as Word?,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isFlipped: null == isFlipped
          ? _self.isFlipped
          : isFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      correctCount: null == correctCount
          ? _self.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of TestSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res>? get currentWord {
    if (_self.currentWord == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_self.currentWord!, (value) {
      return _then(_self.copyWith(currentWord: value));
    });
  }
}

// dart format on
