import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/providers/providers.dart';
import 'package:product_manager/app/widgets/product_view_section.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setFavoriteProductsProvider, (prev, current) {
      if (current.contains(productModel)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product added to favorites'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product removed from favorites'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(setFavoriteProductsProvider.notifier)
              .addToFavorites(productModel);
        },
        child: const Icon(Icons.shopping_cart_rounded),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductViewSection(productModel: productModel),
          ),
        ],
      ),
    );
  }
}
