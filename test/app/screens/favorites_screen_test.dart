import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_manager/app/screens/favorites_screen.dart';

import '../../helpers/helpers.dart';

void main() {
  group('favorites screen ...', () {
    testWidgets('should render correctly FavoritesScreen', (tester) async {
      await tester.pumpApp(
        const ProviderScope(
          child: FavoritesScreen(),
        ),
      );

      expect(find.byType(FavoritesScreen), findsOneWidget);
    });

    testWidgets(
        'should render correctly FavoritesScreen with the text Favorites',
        (tester) async {
      await tester.pumpApp(
        const ProviderScope(
          child: FavoritesScreen(),
        ),
      );

      expect(find.text('Favorites'), findsOneWidget);
    });

    testWidgets(
        '''should render correctly FavoritesScreen with the text No favorites yet''',
        (tester) async {
      await tester.pumpApp(
        const ProviderScope(
          child: FavoritesScreen(),
        ),
      );

      expect(find.text('No favorites yet'), findsOneWidget);
    });
  });
}
