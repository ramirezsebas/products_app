import 'package:flutter_test/flutter_test.dart';
import 'package:product_manager/app/models/product_model.dart';

void main() {
  group('product model ...', () {
    test('fromJson should return correct model', () {
      // Arrange
      final json = {
        'id': 1,
        'title': 'iPhone 9',
        'description': 'An apple mobile which is nothing like apple',
        'price': 549,
        'discountPercentage': 12.96,
        'rating': 4.69,
        'stock': 94,
        'brand': 'Apple',
        'category': 'smartphones',
        'thumbnail': 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
        'images': [
          'https://cdn.dummyjson.com/product-images/1/1.jpg',
          'https://cdn.dummyjson.com/product-images/1/2.jpg',
          'https://cdn.dummyjson.com/product-images/1/3.jpg',
          'https://cdn.dummyjson.com/product-images/1/4.jpg',
          'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
        ],
      };

      // Act
      final product = ProductModel.fromJson(json);

      // Assert
      expect(product.id, 1);
      expect(product.title, 'iPhone 9');
      expect(
        product.description,
        'An apple mobile which is nothing like apple',
      );
      expect(product.price, 549);
      expect(product.discountPercentage, 12.96);
      expect(product.rating, 4.69);
      expect(product.stock, 94);
      expect(product.brand, 'Apple');
      expect(product.category, 'smartphones');
      expect(
        product.thumbnail,
        'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
      );
      expect(product.images, [
        'https://cdn.dummyjson.com/product-images/1/1.jpg',
        'https://cdn.dummyjson.com/product-images/1/2.jpg',
        'https://cdn.dummyjson.com/product-images/1/3.jpg',
        'https://cdn.dummyjson.com/product-images/1/4.jpg',
        'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
      ]);
    });

    test(
      'FromEmpty should return an empty model(Initialized data)',
      () {
        // Act
        final product = ProductModel.fromEmpty();

        // Assert
        expect(product.id, 0);
        expect(product.title, '');
        expect(product.description, '');
        expect(product.price, 0.0);
        expect(product.discountPercentage, 0.0);
        expect(product.rating, 0.0);
        expect(product.stock, 0);
        expect(product.brand, '');
        expect(product.category, '');
        expect(product.thumbnail, '');
        expect(product.images, List<String>.empty());
      },
    );

    test('fromJson handle default cases', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final product = ProductModel.fromJson(json);

      // Assert
      expect(product.id, 0);
      expect(product.title, '');
      expect(product.description, '');
      expect(product.price, 0.0);
      expect(product.discountPercentage, 0.0);
      expect(product.rating, 0.0);
      expect(product.stock, 0);
      expect(product.brand, '');
      expect(product.category, '');
      expect(product.thumbnail, '');
      expect(product.images, List<String>.empty());
    });
  });
}
