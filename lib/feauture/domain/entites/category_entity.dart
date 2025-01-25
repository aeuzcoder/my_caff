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
}
