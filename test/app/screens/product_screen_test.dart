import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/screens/product_screen.dart';
import '../../helpers/helpers.dart';

void main() {
  group('product screen ...', () {
    testWidgets('should render correctly ProductsScreen', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          const ProviderScope(
            child: ProductScreen(
              productModel: ProductModel(
                id: 1,
                title: 'Product 1',
                discountPercentage: 10,
                rating: 4.5,
                stock: 10,
                brand: 'Brand 1',
                category: 'Category 1',
                thumbnail: 'https://cdn.dummyjson.com/product-thumbnails/1.jpg',
                images: [],
                description: 'Description 1',
                price: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ProductScreen), findsOneWidget);
    });

    testWidgets(
        'should render correctly ProductScreen with the each ListTile widget',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          const ProviderScope(
            child: ProductScreen(
              productModel: ProductModel(
                id: 1,
                title: 'Product 1',
                discountPercentage: 10,
                rating: 4.5,
                stock: 10,
                brand: 'Brand 1',
                category: 'Category 1',
                thumbnail: 'https://cdn.dummyjson.com/product-thumbnails/1.jpg',
                images: [],
                description: 'Description 1',
                price: 100,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Producto'), findsOneWidget);
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Descripcion'), findsOneWidget);
      expect(find.text('Description 1'), findsOneWidget);
      expect(find.text('Precio'), findsOneWidget);
      expect(find.text(r'$100.00'), findsOneWidget);
    });
  });
}
