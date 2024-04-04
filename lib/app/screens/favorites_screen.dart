import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/providers/providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(setFavoriteProductsProvider);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: products.isEmpty
            ? const Center(
                child: Text('No favorites yet'),
              )
            : ListView.separated(
                itemCount: products.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        product.thumbnail,
                      ),
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.description),
                    trailing: Text(product.price.toString()),
                    onTap: () {
                      ref
                          .read(selectProductProvider.notifier)
                          .selectProduct(product);

                      GoRouter.of(context).go(
                        '/products/${product.id}',
                        extra: product,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
