class ItemModule {
  final int itemId;
  final String name;
  final String nameAr;
  final String desc;
  final String descAr;
  final String image;
  final int count;
  final double price;
  final int discount;
  final String itemCreate;
  final int category;

  ItemModule({
    required this.itemId,
    required this.name,
    required this.nameAr,
    required this.desc,
    required this.descAr,
    required this.image,
    required this.count,
    required this.price,
    required this.discount,
    required this.itemCreate,
    required this.category,
  });

  factory ItemModule.fromJeson(Map<String, dynamic> json) {
    return ItemModule(
      itemId: json["item_id"],
      name: json["item_name"],
      nameAr: json["item_name_ar"],
      desc: json["item_desc"],
      image: json["item_image"],
      descAr: json["item_desc_ar"],
      count: json["item_count"],
      price: double.parse(json["item_price"].toString()),
      discount: json["item_discount"],
      category: json["item_category"],
      itemCreate: json["item_create"],
    );
  }
}
