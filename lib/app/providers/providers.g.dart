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
String _$productsRepositoryHash() =>
    r'b72cdf77ea528b195bbe23cb3a24635fc2f8d9d7';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider =
    AutoDisposeProvider<ProductsRepository>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRepositoryRef = AutoDisposeProviderRef<ProductsRepository>;
String _$usersRepositoryHash() => r'437d4c5507aed217460292b94650a86e2eed71ee';

/// See also [usersRepository].
@ProviderFor(usersRepository)
final usersRepositoryProvider = AutoDisposeProvider<UsersRepository>.internal(
  usersRepository,
  name: r'usersRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usersRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersRepositoryRef = AutoDisposeProviderRef<UsersRepository>;
String _$fetchProductsHash() => r'a7288da45e9de72a197c27186893a7d7bb739966';

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
String _$fetchRandomUserHash() => r'941a78fe871bb34dbb543c66395df86653bb333b';

/// See also [fetchRandomUser].
@ProviderFor(fetchRandomUser)
final fetchRandomUserProvider = AutoDisposeFutureProvider<UserModel>.internal(
  fetchRandomUser,
  name: r'fetchRandomUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchRandomUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchRandomUserRef = AutoDisposeFutureProviderRef<UserModel>;
String _$selectProductHash() => r'c55d0c307340fded6e4578ffacb3722aa769594e';

/// See also [SelectProduct].
@ProviderFor(SelectProduct)
final selectProductProvider =
    AutoDisposeNotifierProvider<SelectProduct, ProductModel>.internal(
  SelectProduct.new,
  name: r'selectProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectProduct = AutoDisposeNotifier<ProductModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
