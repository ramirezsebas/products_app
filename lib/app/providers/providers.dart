import 'package:dio/dio.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/repositories/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Dio clientRepository(ClientRepositoryRef ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ),
  );
}

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  final client = ref.watch(clientRepositoryProvider);

  return ProductsRepository(client);
}

@riverpod
Future<List<ProductModel>> fetchProducts(
  FetchProductsRef ref,
) async {
  final repository = ref.watch(productsRepositoryProvider);

  return repository.getProducts();
}

@riverpod
class SelectProduct extends _$SelectProduct {
  @override
  ProductModel build() {
    return ProductModel.fromEmpty();
  }

  void selectProduct(ProductModel product) {
    state = product;
  }
}
