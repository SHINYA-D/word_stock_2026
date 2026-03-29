// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wordListViewModelHash() => r'd1518e65274186b547b6f6a0fe3bb7aaecae31c7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WordListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<Word>> {
  late final String folderId;

  FutureOr<List<Word>> build(
    String folderId,
  );
}

/// See also [WordListViewModel].
@ProviderFor(WordListViewModel)
const wordListViewModelProvider = WordListViewModelFamily();

/// See also [WordListViewModel].
class WordListViewModelFamily extends Family<AsyncValue<List<Word>>> {
  /// See also [WordListViewModel].
  const WordListViewModelFamily();

  /// See also [WordListViewModel].
  WordListViewModelProvider call(
    String folderId,
  ) {
    return WordListViewModelProvider(
      folderId,
    );
  }

  @override
  WordListViewModelProvider getProviderOverride(
    covariant WordListViewModelProvider provider,
  ) {
    return call(
      provider.folderId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wordListViewModelProvider';
}

/// See also [WordListViewModel].
class WordListViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WordListViewModel, List<Word>> {
  /// See also [WordListViewModel].
  WordListViewModelProvider(
    String folderId,
  ) : this._internal(
          () => WordListViewModel()..folderId = folderId,
          from: wordListViewModelProvider,
          name: r'wordListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordListViewModelHash,
          dependencies: WordListViewModelFamily._dependencies,
          allTransitiveDependencies:
              WordListViewModelFamily._allTransitiveDependencies,
          folderId: folderId,
        );

  WordListViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderId,
  }) : super.internal();

  final String folderId;

  @override
  FutureOr<List<Word>> runNotifierBuild(
    covariant WordListViewModel notifier,
  ) {
    return notifier.build(
      folderId,
    );
  }

  @override
  Override overrideWith(WordListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: WordListViewModelProvider._internal(
        () => create()..folderId = folderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderId: folderId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WordListViewModel, List<Word>>
      createElement() {
    return _WordListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordListViewModelProvider && other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WordListViewModelRef on AutoDisposeAsyncNotifierProviderRef<List<Word>> {
  /// The parameter `folderId` of this provider.
  String get folderId;
}

class _WordListViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WordListViewModel,
        List<Word>> with WordListViewModelRef {
  _WordListViewModelProviderElement(super.provider);

  @override
  String get folderId => (origin as WordListViewModelProvider).folderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
