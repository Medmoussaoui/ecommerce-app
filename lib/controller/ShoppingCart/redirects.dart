import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:get/get.dart';

class ShoppingCartRedirects {
  toItemDetails(ShoppingCartItem item) {
    bool hasInstance = Get.isRegistered<ItemDetailsController>();
    if (hasInstance) {
      var instance = Get.find<ItemDetailsController>();
      instance.item.add(item);
      instance.picutreHeroId = "shopping ${item.id}";
      return Get.toNamed(AppRoute.itemDetailsScreen);
    }
    Get.toNamed(
      AppRoute.itemDetailsScreen,
      arguments: {
        "item": item,
        "quantity": item.quantity,
        "heroId": "shopping ${item.id}",
      },
    );
  }
}
