// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:product_manager/app/repositories/products_repository.dart';
import 'package:product_manager/app/widgets/products_list.dart';

import '../../helpers/helpers.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late ProductsRepository mockProductsRepository;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
  });

  testWidgets('products list ...', (tester) async {
    when(() => mockProductsRepository.getProducts()).thenAnswer(
      (_) async => [],
    );

    await tester.pumpApp(
      ProviderScope(
        overrides: [
          productsRepositoryProvider.overrideWith(
            (ref) => mockProductsRepository,
          ),
        ],
        child: Scaffold(
          body: ProductsList(
            checkIsFavorite: (val) => true,
            addToFavorites: (val) {},
          ),
        ),
      ),
    );

    expect(
      find.byType(ProductsList),
      findsOneWidget,
    );
  });

  testWidgets('products list with products ...', (tester) async {
    when(() => mockProductsRepository.getProducts()).thenAnswer(
      (_) async => List.generate(
        10,
        (index) => ProductModel(
          id: index,
          title: 'Product $index',
          description: 'Description $index',
          price: 100,
          stock: 10,
          category: 'Category $index',
          brand: 'Brand $index',
          rating: 4.5,
          discountPercentage: 10,
          thumbnail: 'https://cdn.dummyjson.com/product-thumbnails/$index.jpg',
          images: const [],
        ),
      ),
    );

    await tester.pumpApp(
      ProviderScope(
        overrides: [
          productsRepositoryProvider.overrideWith(
            (ref) => mockProductsRepository,
          ),
        ],
        child: Scaffold(
          body: ProductsList(
            checkIsFavorite: (val) => true,
            addToFavorites: (val) {},
          ),
        ),
      ),
    );

    expect(
      find.byType(ProductsList),
      findsOneWidget,
    );
  });
}
