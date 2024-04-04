import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/providers/providers.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(fetchProductsProvider);
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
            products.when(
              data: (data) {
                return SliverList.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = data[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product.thumbnail),
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: Text(product.price.toString()),
                      onTap: () {
                        ref
                            .read(selectProductProvider.notifier)
                            .selectProduct(product);

                        GoRouter.of(context).push(
                          '/products/${product.id}',
                          extra: product,
                        );
                      },
                    );
                  },
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
          ],
        ),
      ),
    );
  }
}
