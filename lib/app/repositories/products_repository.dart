import 'package:dio/dio.dart';
import 'package:product_manager/app/models/product_model.dart';

class ProductsRepository {
  ProductsRepository(this.client);

  final Dio client;

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await client.get('/products');

      final responseDate = response.data as Map<String, dynamic>;

      final productsMap = responseDate['products'] as List<dynamic>?;

      if (productsMap == null) {
        throw Exception('No products found');
      }

      final products = productsMap
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return products;
    } catch (e) {
      rethrow;
    }
  }
}
