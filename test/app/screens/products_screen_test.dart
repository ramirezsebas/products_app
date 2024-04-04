// ignore_for_file: require_trailing_commas, scoped_providers_should_specify_dependencies, lines_longer_than_80_chars

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/models/user_model.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:product_manager/app/repositories/products_repository.dart';
import 'package:product_manager/app/repositories/users_repository.dart';
import 'package:product_manager/app/screens/products_screen.dart';
import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UsersRepository {}

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late UsersRepository userRepository;
  late ProductsRepository productsRepository;

  setUp(() {
    userRepository = MockUserRepository();
    productsRepository = MockProductsRepository();
  });

  group('products screen ...', () {
    testWidgets('should render correctly ProductsScreen', (tester) async {
      await mockNetworkImagesFor(
        () async {
          when(() => userRepository.getRandomUser(any())).thenAnswer(
            (_) async => const UserModel(
              name: 'Matias Ramirez',
              avatarUrl: 'https://cdn.dummyjson.com/user-avatar/1.jpg',
            ),
          );

          when(() => productsRepository.getProducts()).thenAnswer((_) async => [
                const ProductModel(
                  id: 1,
                  title: 'Product 1',
                  discountPercentage: 10,
                  rating: 4.5,
                  stock: 10,
                  brand: 'Brand 1',
                  category: 'Category 1',
                  thumbnail:
                      'https://cdn.dummyjson.com/product-thumbnails/1.jpg',
                  images: [],
                  description: 'Description 1',
                  price: 100,
                ),
                const ProductModel(
                  id: 2,
                  title: 'Product 2',
                  discountPercentage: 20,
                  rating: 4.0,
                  stock: 20,
                  brand: 'Brand 2',
                  category: 'Category 2',
                  thumbnail:
                      'https://cdn.dummyjson.com/product-thumbnails/2.jpg',
                  images: [],
                  description: 'Description 2',
                  price: 200,
                ),
              ]);
          await tester.pumpApp(
            ProviderScope(
              overrides: [
                usersRepositoryProvider.overrideWith(
                  (ref) => userRepository,
                ),
                productsRepositoryProvider.overrideWith(
                  (ref) => productsRepository,
                ),
              ],
              child: const ProductsScreen(),
            ),
          );

          await tester.pump();

          expect(find.byType(ProductsScreen), findsOneWidget);
        },
      );
    });
  });
}
