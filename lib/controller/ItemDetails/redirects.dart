import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:get/get.dart';

class ItemDetailsRedirects {
  final ItemDetailsController controller;

  ItemDetailsRedirects(this.controller);

  toShoppingCart() {
    bool fromShoppingCart = controller.checkIfComesFromShoppingCart();
    // check if we comes to ItemDetails Screen from Shopping Cart Screen
    if (fromShoppingCart) {
      Get.back();
      onPop();
      return;
    }
    Get.toNamed(AppRoute.shoppingCart);
  }

  onPop() {
    if (controller.item.length > 1) {
      controller.item.removeLast();
    }
    if (controller.checkIfComesFromShoppingCart()) {
      Get.find<ShoppringCartController>().update(["body"]);
    }
    return true;
  }
}
