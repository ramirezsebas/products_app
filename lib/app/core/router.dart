import 'package:go_router/go_router.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/screens/error_screen.dart';
import 'package:product_manager/app/screens/favorites_screen.dart';

import 'package:product_manager/app/screens/product_screen.dart';
import 'package:product_manager/app/screens/products_screen.dart';

final router = GoRouter(
  initialLocation: '/products',
  routes: [
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
      routes: [
        GoRoute(
          path: 'favorites',
          builder: (context, state) {
            return const FavoritesScreen();
          },
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final extra = state.extra as ProductModel?;

            if (extra == null) {
              return const ErrorScreen();
            }

            return ProductScreen(
              productModel: extra,
            );
          },
        ),
      ],
    ),
  ],
);
