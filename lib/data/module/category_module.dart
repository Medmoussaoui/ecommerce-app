class CategoryModule {
  late final int id;
  late final String name;
  late final String nameAr;
  late final String categoryCreate;

  CategoryModule({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.categoryCreate,
  });

  factory CategoryModule.fromJson(Map<String, dynamic> json) {
    return CategoryModule(
      id: json["category_id"],
      name: json["category_name"],
      nameAr: json["category_name_ar"],
      categoryCreate: json["category_create"],
    );
  }
}
