import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FullImageScreen extends StatelessWidget {
  const FullImageScreen({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 8,
          clipBehavior: Clip.none,
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: Hero(
            tag: image,
            child: CachedNetworkImage(
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
