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
String _$fetchProductsHash() => r'5b55db9093640870dabf8d36f8cb7ecc21906cae';

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

/// See also [fetchProducts].
@ProviderFor(fetchProducts)
const fetchProductsProvider = FetchProductsFamily();

/// See also [fetchProducts].
class FetchProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [fetchProducts].
  const FetchProductsFamily();

  /// See also [fetchProducts].
  FetchProductsProvider call({
    num limit = 30,
    num skip = 0,
  }) {
    return FetchProductsProvider(
      limit: limit,
      skip: skip,
    );
  }

  @override
  FetchProductsProvider getProviderOverride(
    covariant FetchProductsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      skip: provider.skip,
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
  String? get name => r'fetchProductsProvider';
}

/// See also [fetchProducts].
class FetchProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [fetchProducts].
  FetchProductsProvider({
    num limit = 30,
    num skip = 0,
  }) : this._internal(
          (ref) => fetchProducts(
            ref as FetchProductsRef,
            limit: limit,
            skip: skip,
          ),
          from: fetchProductsProvider,
          name: r'fetchProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductsHash,
          dependencies: FetchProductsFamily._dependencies,
          allTransitiveDependencies:
              FetchProductsFamily._allTransitiveDependencies,
          limit: limit,
          skip: skip,
        );

  FetchProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.skip,
  }) : super.internal();

  final num limit;
  final num skip;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(FetchProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductsProvider._internal(
        (ref) => create(ref as FetchProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        skip: skip,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _FetchProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductsProvider &&
        other.limit == limit &&
        other.skip == skip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, skip.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `limit` of this provider.
  num get limit;

  /// The parameter `skip` of this provider.
  num get skip;
}

class _FetchProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with FetchProductsRef {
  _FetchProductsProviderElement(super.provider);

  @override
  num get limit => (origin as FetchProductsProvider).limit;
  @override
  num get skip => (origin as FetchProductsProvider).skip;
}

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
String _$setFavoriteProductsHash() =>
    r'df960a6a6a2f256ca6526c40bf9f2aa881038378';

/// See also [SetFavoriteProducts].
@ProviderFor(SetFavoriteProducts)
final setFavoriteProductsProvider =
    NotifierProvider<SetFavoriteProducts, List<ProductModel>>.internal(
  SetFavoriteProducts.new,
  name: r'setFavoriteProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setFavoriteProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SetFavoriteProducts = Notifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
