// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsViewModelHash() => r'a6bb8199e1769dd60f5ebe77bee7da539098f840';

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

abstract class _$SettingsViewModel
    extends BuildlessAutoDisposeAsyncNotifier<UserSettings> {
  late final String userId;

  FutureOr<UserSettings> build(
    String userId,
  );
}

/// See also [SettingsViewModel].
@ProviderFor(SettingsViewModel)
const settingsViewModelProvider = SettingsViewModelFamily();

/// See also [SettingsViewModel].
class SettingsViewModelFamily extends Family<AsyncValue<UserSettings>> {
  /// See also [SettingsViewModel].
  const SettingsViewModelFamily();

  /// See also [SettingsViewModel].
  SettingsViewModelProvider call(
    String userId,
  ) {
    return SettingsViewModelProvider(
      userId,
    );
  }

  @override
  SettingsViewModelProvider getProviderOverride(
    covariant SettingsViewModelProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'settingsViewModelProvider';
}

/// See also [SettingsViewModel].
class SettingsViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SettingsViewModel, UserSettings> {
  /// See also [SettingsViewModel].
  SettingsViewModelProvider(
    String userId,
  ) : this._internal(
          () => SettingsViewModel()..userId = userId,
          from: settingsViewModelProvider,
          name: r'settingsViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsViewModelHash,
          dependencies: SettingsViewModelFamily._dependencies,
          allTransitiveDependencies:
              SettingsViewModelFamily._allTransitiveDependencies,
          userId: userId,
        );

  SettingsViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<UserSettings> runNotifierBuild(
    covariant SettingsViewModel notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(SettingsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SettingsViewModelProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SettingsViewModel, UserSettings>
      createElement() {
    return _SettingsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsViewModelProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SettingsViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<UserSettings> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _SettingsViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SettingsViewModel,
        UserSettings> with SettingsViewModelRef {
  _SettingsViewModelProviderElement(super.provider);

  @override
  String get userId => (origin as SettingsViewModelProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
