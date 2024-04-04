import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_manager/app/models/product_model.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
