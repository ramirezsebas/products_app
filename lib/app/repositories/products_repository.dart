import 'package:dio/dio.dart';
import 'package:product_manager/app/models/product_model.dart';

class ProductsRepository {
  ProductsRepository({required this.client});

  final Dio client;

  Future<List<ProductModel>> getProducts({
    num limit = 30,
    num skip = 0,
  }) async {
    try {
      final response =
          await client.get<dynamic>('/products?limit=$limit&skip=$skip');

      final responseDate = response.data as Map<String, dynamic>;

      final productsMap = responseDate['products'] as List<dynamic>?;

      if (productsMap == null) {
        throw Exception('No products found');
      }

      final products = productsMap
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return products;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
