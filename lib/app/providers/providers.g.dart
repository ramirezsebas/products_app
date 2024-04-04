// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientRepositoryHash() => r'79b6c82e485f2c03ea10b83932bcd4b0feea7d2f';

/// See also [clientRepository].
@ProviderFor(clientRepository)
final clientRepositoryProvider = AutoDisposeProvider<Dio>.internal(
  clientRepository,
  name: r'clientRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clientRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRepositoryRef = AutoDisposeProviderRef<Dio>;
String _$fetchProductsHash() => r'8b05c34596b45d466cfa4677b06636e5809f08b5';

/// See also [fetchProducts].
@ProviderFor(fetchProducts)
final fetchProductsProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  fetchProducts,
  name: r'fetchProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
