import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:shimmer/shimmer.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({
    required this.checkIsFavorite,
    required this.addToFavorites,
    super.key,
  });

  final bool Function(ProductModel) checkIsFavorite;
  final void Function(ProductModel) addToFavorites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        return ref.invalidate(fetchProductsProvider());
      },
      child: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const limit = 30;
            final skip = (index ~/ limit) * limit;
            final itemIndexInProducts = index % limit;

            final products = ref.watch(
              fetchProductsProvider(
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
                          addToFavorites(product);
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: !checkIsFavorite(product)
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
                      radius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                        product.thumbnail,
                        errorListener: (exception) {
                          debugPrint('Error: $exception');
                        },
                      ),
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
    );
  }
}
