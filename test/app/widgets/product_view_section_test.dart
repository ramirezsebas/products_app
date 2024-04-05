import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/widgets/product_view_section.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets('product view section', (tester) async {
    await tester.pumpApp(
      const ProductViewSection(
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
    );

    expect(
      find.byType(ProductViewSection),
      findsOneWidget,
    );
  });

  testWidgets('product view section swiper ', (tester) async {
    await tester.pumpApp(
      const ProductViewSection(
        productModel: ProductModel(
          id: 1,
          title: 'Product 1',
          discountPercentage: 10,
          rating: 4.5,
          stock: 10,
          brand: 'Brand 1',
          category: 'Category 1',
          thumbnail: 'https://cdn.dummyjson.com/product-thumbnails/1.jpg',
          images: [
            'https://cdn.dummyjson.com/product-thumbnails/1.jpg',
            'https://cdn.dummyjson.com/product-thumbnails/2.jpg',
            'https://cdn.dummyjson.com/product-thumbnails/3.jpg',
          ],
          description: 'Description 1',
          price: 100,
        ),
      ),
    );

    expect(
      find.byType(Swiper),
      findsOneWidget,
    );
  });
}
