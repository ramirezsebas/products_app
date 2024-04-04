import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/repositories/products_repository.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dio;
  late ProductsRepository productsRepository;

  setUp(() {
    dio = DioMock();
    productsRepository = ProductsRepository(dio);
  });

  group('products repository ...', () {
    test(
      'getProducts should return a list of ProductModel',
      () async {
        // Arrange

        const tProductsJson = [
          {
            'id': 1,
            'title': 'iPhone 9',
            'description': 'An apple mobile which is nothing like apple',
            'price': 549,
            'discountPercentage': 12.96,
            'rating': 4.69,
            'stock': 94,
            'brand': 'Apple',
            'category': 'smartphones',
            'thumbnail':
                'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
            'images': [
              'https://cdn.dummyjson.com/product-images/1/1.jpg',
              'https://cdn.dummyjson.com/product-images/1/2.jpg',
              'https://cdn.dummyjson.com/product-images/1/3.jpg',
              'https://cdn.dummyjson.com/product-images/1/4.jpg',
              'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
            ],
          }
        ];

        const tProducts = [
          ProductModel(
            id: 1,
            title: 'iPhone 9',
            description: 'An apple mobile which is nothing like apple',
            price: 549,
            discountPercentage: 12.96,
            rating: 4.69,
            stock: 94,
            brand: 'Apple',
            category: 'smartphones',
            thumbnail:
                'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
            images: [
              'https://cdn.dummyjson.com/product-images/1/1.jpg',
              'https://cdn.dummyjson.com/product-images/1/2.jpg',
              'https://cdn.dummyjson.com/product-images/1/3.jpg',
              'https://cdn.dummyjson.com/product-images/1/4.jpg',
              'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
            ],
          ),
        ];

        when(
          () => dio.get(any()),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'products': tProductsJson,
            },
            requestOptions: RequestOptions(
              method: 'GET',
              path: '/products',
            ),
          ),
        );

        // Act
        final result = await productsRepository.getProducts();

        // Assert
        expect(result.length, tProducts.length);
        expect(result.first.id, tProducts.first.id);
        expect(result.first.title, tProducts.first.title);
        expect(result.first.description, tProducts.first.description);
        expect(result.first.price, tProducts.first.price);
        expect(
          result.first.discountPercentage,
          tProducts.first.discountPercentage,
        );
        expect(result.first.rating, tProducts.first.rating);
        expect(result.first.stock, tProducts.first.stock);
        expect(result.first.brand, tProducts.first.brand);
        expect(result.first.category, tProducts.first.category);
        expect(result.first.thumbnail, tProducts.first.thumbnail);
        expect(result.first.images, tProducts.first.images);

        verify(() => dio.get(any())).called(1);
      },
    );
  });
}