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
        body: CustomScrollView(
          slivers: [
            user.when(
              data: (data) {
                return SliverAppBar(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatarUrl),
                  ),
                  title: Text('Welcome, ${data.name}'),
                  floating: true,
                  snap: true,
                  actions: [
                    FavoriteIconButton(
                      numberOfFavorites:
                          ref.watch(setFavoriteProductsProvider).length,
                      onPressed: () {
                        GoRouter.of(context).go(
                          '/products/favorites',
                        );
                      },
                    ),
                  ],
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => SliverFillRemaining(
                child: Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
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
                              onPressed: (context) {},
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.favorite_rounded,
                              label: 'Add to Favorite',
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
          ],
        ),
      ),
    );
  }
}
