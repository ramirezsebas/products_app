import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_manager/app/widgets/favorite_icon_button.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets('favorite icon button ...', (tester) async {
    await tester.pumpApp(
      FavoriteIconButton(
        numberOfFavorites: 10,
        onPressed: () {},
      ),
    );

    expect(
      find.byType(FavoriteIconButton),
      findsOneWidget,
    );
  });

  testWidgets('favorite icon button with 0 favorites ...', (tester) async {
    await tester.pumpApp(
      FavoriteIconButton(
        numberOfFavorites: 0,
        onPressed: () {},
      ),
    );

    expect(
      find.byType(FavoriteIconButton),
      findsOneWidget,
    );
  });

  testWidgets('favorite icon button onPressed ...', (tester) async {
    var pressed = false;
    await tester.pumpApp(
      FavoriteIconButton(
        numberOfFavorites: 10,
        onPressed: () {
          pressed = true;
        },
      ),
    );

    await tester.tap(find.byKey(const Key('iconButton')));

    await tester.pump();

    expect(pressed, true);
  });
}
