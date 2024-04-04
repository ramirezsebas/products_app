import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:product_manager/app/providers/providers.dart';

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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 300,
                  child: Swiper(
                    itemCount: productModel.images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              productModel.images[index],
                            ),
                          ),
                        ),
                      );
                    },
                    pagination: const SwiperPagination(),
                    controller: SwiperController(),
                    autoplay: true,
                  ),
                ),
                ListTile(
                  title: Text(productModel.title),
                  subtitle: Text(productModel.description),
                  trailing: Text(productModel.price.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
