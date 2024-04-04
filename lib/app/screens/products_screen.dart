import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:product_manager/app/widgets/favorite_icon_button.dart';
import 'package:shimmer/shimmer.dart';

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
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              const limit = 10;
              final skip = index ~/ limit;

              final itemIndexInProducts = index % limit;

              final products = ref.watch(
                fetchProductsProvider(
                  limit: limit,
                  skip: skip,
                ),
              );

              return products.when(
                data: (data) {
                  if (itemIndexInProducts >= data.length) {
                    return null;
                  }

                  final product = data[itemIndexInProducts];
                  return Slidable(
                    key: ValueKey(product.id),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            ref
                                .read(setFavoriteProductsProvider.notifier)
                                .addToFavorites(product);
                          },
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: !ref
                                  .watch(
                                    setFavoriteProductsProvider.notifier,
                                  )
                                  .isFavorite(product)
                              ? Icons.favorite_border_rounded
                              : Icons.favorite_rounded,
                          label: !ref
                                  .watch(
                                    setFavoriteProductsProvider.notifier,
                                  )
                                  .isFavorite(product)
                              ? 'Add to favorites'
                              : 'Remove from favorites',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product.thumbnail),
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: IconButton(
                        icon: Icon(
                          !ref
                                  .watch(
                                    setFavoriteProductsProvider.notifier,
                                  )
                                  .isFavorite(product)
                              ? Icons.favorite_border_rounded
                              : Icons.favorite_rounded,
                        ),
                        onPressed: () {
                          ref
                              .read(setFavoriteProductsProvider.notifier)
                              .addToFavorites(product);
                        },
                      ),
                      onTap: () {
                        ref
                            .read(selectProductProvider.notifier)
                            .selectProduct(product);

                        GoRouter.of(context).push(
                          '/products/${product.id}',
                          extra: product,
                        );
                      },
                    ),
                  );
                },
                loading: () => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const ListTile(
                    leading: CircleAvatar(),
                    title: Text(''),
                    subtitle: Text(''),
                    trailing: Text(''),
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
