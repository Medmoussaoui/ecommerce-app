import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:get/get.dart';

class ShoppingCartCheckOutController {
  final ShoppringCartController _controller;

  ShoppingCartCheckOutController(this._controller);

  void onPressed() {
    Get.toNamed(AppRoute.checkOutScreen);
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _controller.items) {
      total += (item.price * item.quantity);
    }
    return total;
  }

  double getTotalDiscount() {
    double totalDiscount = 0;
    for (var item in _controller.items) {
      if (item.discount == 0) continue;
      totalDiscount += ((item.price * item.quantity) * item.discount) / 100;
    }
    return totalDiscount;
  }

  void incrementItem(ShoppingCartItem item) {
    _controller.total.value += (item.price * item.quantity);
    if (item.discount == 0) return;
    _controller.totalDiscount.value += ((item.price * item.quantity) * item.discount) / 100;
  }

  void descrimentItem(ShoppingCartItem item) {
    _controller.total.value -= (item.price * item.quantity);
    if (item.discount == 0) return;
    _controller.totalDiscount.value -= ((item.price * item.quantity) * item.discount) / 100;
  }

  void initial() {
    _controller.total.value = getTotalPrice();
    _controller.totalDiscount.value = getTotalDiscount();
  }
}
