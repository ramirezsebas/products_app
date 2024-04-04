import 'package:dio/dio.dart';
import 'package:product_manager/app/models/product_model.dart';

class ProductsRepository {
  ProductsRepository(this.client);

  final Dio client;

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get('/products');

    final responseDate = response.data as Map<String, dynamic>;

    final productsMap = responseDate['products'] as List<Map<String, dynamic>>?;

    if (productsMap == null) {
      throw Exception('No products found');
    }

    final products = productsMap.map(ProductModel.fromJson).toList();

    return products;
  }
}
