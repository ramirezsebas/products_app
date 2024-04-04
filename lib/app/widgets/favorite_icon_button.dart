import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    required this.numberOfFavorites,
    required this.onPressed,
    super.key,
  });

  final int numberOfFavorites;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite_border_rounded),
          onPressed: onPressed,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 10,
            child: Text(
              numberOfFavorites.toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
