import 'package:ecommercecourse/data/module/item_product_module.dart';

class ShoppingCartItem extends ItemModule {
  ShoppingCartItem({
    required super.itemId,
    required super.name,
    required super.nameAr,
    required super.desc,
    required super.descAr,
    required super.image,
    required super.count,
    required super.price,
    required super.discount,
    required super.itemCreate,
    required super.category,
    required this.id,
    required this.quantity,
  });

  final int id;
  int quantity;

  factory ShoppingCartItem.fromJeson(Map<String, dynamic> json) {
    return ShoppingCartItem(
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
      id: json["id"],
      quantity: json["quantity"],
    );
  }
}
