// ProductModel:
import 'package:my_caff/feauture/data/models/category_model.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.categoryId,
    required super.name,
    required super.amount,
    required super.userId,
    super.discountStart,
    required super.discountPrice,
    required super.ratingCount,
    required super.id,
    required super.price,
    required super.image,
    required super.discount,
    super.discountEnd,
    required super.averageRating,
    required super.kcal,
    required super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryId: json['category_id'],
      name: json['name'],
      amount: json['amount'],
      userId: json['user_id'],
      discountStart: json['discount_start'],
      discountPrice: json['discount_price'],
      ratingCount: json['rating_count'],
      id: json['id'],
      price: json['price'],
      image: json['image'],
      discount: json['discount'],
      discountEnd: json['discount_end'],
      averageRating: json['average_rating'].toDouble(),
      kcal: json['kcal'],
      category: CategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'amount': amount,
      'user_id': userId,
      'discount_start': discountStart,
      'discount_price': discountPrice,
      'rating_count': ratingCount,
      'id': id,
      'price': price,
      'image': image,
      'discount': discount,
      'discount_end': discountEnd,
      'average_rating': averageRating,
      'kcal': kcal,
      'category': category,
    };
  }
}
