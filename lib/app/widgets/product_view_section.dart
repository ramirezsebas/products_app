import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:product_manager/app/models/product_model.dart';

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
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
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
    );
  }
}
