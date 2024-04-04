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
Future<List<ProductModel>> fetchProducts(
  FetchProductsRef ref,
) async {
  final client = ref.watch(clientRepositoryProvider);

  final repository = ProductsRepository(client);

  return repository.getProducts();
}
