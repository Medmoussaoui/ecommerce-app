import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:get/get.dart';

class DisplayItemsSearchRedirect {
  void toItemDetails(ItemModule item) {
    Get.toNamed(AppRoute.itemDetailsScreen, arguments: {
      "item": item,
      "heroId": "homeScreen ${item.itemId}",
    });
  }
}
