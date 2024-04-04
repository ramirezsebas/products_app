import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:product_manager/app/screens/full_image_screen.dart';
import '../../helpers/helpers.dart';

void main() {
  group('full image screen ...', () {
    testWidgets('should render correctly FullImageScreen', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          const ProviderScope(
            child: FullImageScreen(
              image: 'https://cdn.dummyjson.com/product-images/1/1.jpg',
            ),
          ),
        ),
      );

      expect(find.byType(FullImageScreen), findsOneWidget);
    });

    testWidgets(
        'should render correctly FullScreenImage with the Image.network widget',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          const ProviderScope(
            child: FullImageScreen(
              image: 'https://cdn.dummyjson.com/product-images/1/1.jpg',
            ),
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
