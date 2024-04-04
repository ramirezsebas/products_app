import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as num? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as num? ?? 0.0,
      discountPercentage: json['discountPercentage'] as num? ?? 0.0,
      rating: json['rating'] as num? ?? 0.0,
      stock: json['stock'] as num? ?? 0,
      brand: json['brand'] as String? ?? '',
      category: json['category'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      images: (json['images'] as List<dynamic>? ?? [])
          .map<String>((e) => e as String)
          .toList(),
    );
  }

  factory ProductModel.fromEmpty() {
    return const ProductModel(
      id: 0,
      title: '',
      description: '',
      price: 0.0,
      discountPercentage: 0.0,
      rating: 0.0,
      stock: 0,
      brand: '',
      category: '',
      thumbnail: '',
      images: [],
    );
  }

  final num id;
  final String title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final num stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discountPercentage,
        rating,
        stock,
        brand,
        category,
        thumbnail,
        images,
      ];
}
