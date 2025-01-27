class CategoryEntity {
  final String name;
  final String description;
  final String image;
  final String addedDate;
  final int id;
  final int? productCount;

  const CategoryEntity(
      {required this.name,
      required this.description,
      required this.image,
      required this.addedDate,
      required this.id,
      required this.productCount});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      addedDate: json['added_date'],
      id: json['id'],
      productCount: json['product_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'added_date': addedDate,
      'id': id,
      'product_count': productCount ?? 0,
    };
  }
}
