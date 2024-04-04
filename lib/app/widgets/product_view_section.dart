import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_manager/app/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

class ProductViewSection extends StatelessWidget {
  const ProductViewSection({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 300,
          child: Swiper(
            itemCount: productModel.images.length,
            itemBuilder: (context, index) {
              final image = productModel.images[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    '/products/${productModel.id}/image/',
                    extra: image,
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: image,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
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
      ],
    );
  }
}
