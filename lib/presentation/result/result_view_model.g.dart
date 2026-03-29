// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$folderNamesHash() => r'cefddf89746cdfb34e0748cc8a58ae099d632884';

/// See also [folderNames].
@ProviderFor(folderNames)
final folderNamesProvider =
    AutoDisposeFutureProvider<Map<String, String>>.internal(
  folderNames,
  name: r'folderNamesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$folderNamesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FolderNamesRef = AutoDisposeFutureProviderRef<Map<String, String>>;
String _$resultViewModelHash() => r'0e7673cd7c91c00140c4c56f7c79db91b2657f0d';

/// See also [ResultViewModel].
@ProviderFor(ResultViewModel)
final resultViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ResultViewModel, List<TestResult>>.internal(
  ResultViewModel.new,
  name: r'resultViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resultViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResultViewModel = AutoDisposeAsyncNotifier<List<TestResult>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
