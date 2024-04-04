import 'package:flutter/material.dart';

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
          child: Hero(
            tag: image,
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
