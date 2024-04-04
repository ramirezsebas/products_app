import 'dart:math';

import 'package:dio/dio.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/models/user_model.dart';
import 'package:product_manager/app/repositories/products_repository.dart';
import 'package:product_manager/app/repositories/users_repository.dart';
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

  return ProductsRepository(client: client);
}

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) {
  final client = ref.watch(clientRepositoryProvider);

  return UsersRepository(client: client);
}

@riverpod
Future<List<ProductModel>> fetchProducts(
  FetchProductsRef ref,
) async {
  final repository = ref.watch(productsRepositoryProvider);

  return repository.getProducts();
}

@riverpod
Future<UserModel> fetchRandomUser(
  FetchRandomUserRef ref,
) async {
  final repository = ref.watch(usersRepositoryProvider);

  final id = (1 + Random().nextInt(10)).toString();

  return repository.getRandomUser(id);
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
