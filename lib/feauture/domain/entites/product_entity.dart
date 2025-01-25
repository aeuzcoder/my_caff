import 'package:my_caff/feauture/domain/entites/category_entity.dart';

class ProductEntity {
  final int categoryId;
  final String name;
  final int amount;
  final int userId;
  final int? discountStart;
  final int discountPrice;
  final int ratingCount;
  final int id;
  final int price;
  final String image;
  final int discount;
  final int? discountEnd;
  final double averageRating;
  final int kcal;
  final CategoryEntity category;

  const ProductEntity(
      {required this.categoryId,
      required this.name,
      required this.amount,
      required this.userId,
      this.discountStart,
      required this.discountPrice,
      required this.ratingCount,
      required this.id,
      required this.price,
      required this.image,
      required this.discount,
      this.discountEnd,
      required this.averageRating,
      required this.kcal,
      required this.category});
}
