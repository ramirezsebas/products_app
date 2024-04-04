import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        heroTag: null,
        onPressed: () {
          GoRouter.of(context).push('/products/favorites');
        },
        child: const Icon(
          Icons.shopping_cart_checkout_rounded,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductViewSection(
              productModel: productModel,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: const Text('Producto'),
                  subtitle: Text(productModel.title),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Descripcion'),
                  subtitle: Text(productModel.description),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Precio'),
                  subtitle: Text(r'$' + productModel.price.toStringAsFixed(2)),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Descuento'),
                  subtitle: Text('${productModel.discountPercentage}%'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Marca'),
                  subtitle: Text(productModel.brand),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Categoria'),
                  subtitle: Text(productModel.category),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Rating'),
                  subtitle: Text(productModel.rating.toString()),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Stock'),
                  subtitle: Text(productModel.stock.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
