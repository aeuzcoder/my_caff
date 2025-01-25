import 'package:my_caff/feauture/domain/entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.name,
    required super.description,
    required super.image,
    required super.addedDate,
    required super.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      addedDate: json['added_date'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'added_date': addedDate,
      'id': id,
    };
  }
}
