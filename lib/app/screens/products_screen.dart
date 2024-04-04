import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/providers/providers.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(fetchProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: products.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final product = data[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text(product.description),
                trailing: Text(product.price.toString()),
                onTap: () => GoRouter.of(context).push(
                  '/products/${product.id}',
                  extra: product,
                ),
              );
            },
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
