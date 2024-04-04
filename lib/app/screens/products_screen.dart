import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:product_manager/app/widgets/favorite_icon_button.dart';
import 'package:product_manager/app/widgets/products_list.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchRandomUserProvider);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: user.when(
            data: (data) {
              return CircleAvatar(
                backgroundImage: NetworkImage(data.avatarUrl),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => const Icon(Icons.error),
          ),
          title: user.when(
            data: (data) {
              return Text('Welcome, ${data.name}');
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          ),
          actions: [
            FavoriteIconButton(
              onPressed: () {
                GoRouter.of(context).push('/products/favorites');
              },
              numberOfFavorites: ref
                  .watch(
                    setFavoriteProductsProvider,
                  )
                  .length,
            ),
          ],
        ),
        body: ProductsList(
          addToFavorites:
              ref.read(setFavoriteProductsProvider.notifier).addToFavorites,
          checkIsFavorite: ref
              .watch(
                setFavoriteProductsProvider.notifier,
              )
              .isFavorite,
        ),
      ),
    );
  }
}
