import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/controller/ItemDetails/redirects.dart';
import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/controller/page_view_controller.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:ecommercecourse/data/source/remote/rest_favorite.dart';
import 'package:ecommercecourse/data/source/remote/rest_item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsController extends GetxController {
  List<ItemModule> item = [];
  int quantity = 1;

  ItemModule get itemData => item.last;

  late RestFavorite restFavorite;
  late RestItemDetails restItemDetails;
  late StatusRequest addToCartStatusRequest;
  late dynamic picutreHeroId;
  late ItemDetailsRedirects redirect;

  /// For test
  List<String> ssd = ["250 GB", "500 GB", "1 TB"];
  List<Color> laptopColors = [Colors.green, Colors.grey, Colors.blueGrey, Colors.black];
  int selectValueIndex = 1;
  int selectColorIndex = 1;

  /// End Test

  onFavorite(bool isFavorite) async {
    final favorite = Get.find<FavoriteController>();
    if (isFavorite) {
      favorite.addItem(item.last);
      return await restFavorite.addToFavorite(item.last.itemId);
    }
    favorite.removeLocale(item.last.itemId);
    await restFavorite.removeItem(item.last.itemId.toString());
  }

  addToCart() async {
    addToCartStatusRequest.loading();

    update(["addToCart"]);
    await Future.delayed(const Duration(seconds: 3));
    addToCartStatusRequest = await restItemDetails.addToCart(item.last.itemId.toString());
    update(["addToCart"]);

    if (addToCartStatusRequest.isSuccess) {
      final currentItem = ShoppingCartItem.fromJeson(addToCartStatusRequest.data.last);
      Get.find<ShoppringCartController>().addItemFromItemDetails(currentItem);
    }
  }

  setQauntity(int value) {
    bool isFromShoppingCart = checkIfComesFromShoppingCart();
    if (isFromShoppingCart) {
      final ref = Get.find<ShoppringCartController>();
      int index = ref.items.indexWhere((element) => element.id == (itemData as ShoppingCartItem).id);
      ref.updateQuantity(index, value);
      return;
    }
    quantity = value;
  }

  initialData() {
    item.add(Get.arguments["item"]);
    picutreHeroId = Get.arguments['heroId'];
  }

  bool checkIfComesFromShoppingCart() {
    RxInt page = Get.find<CustomPageViewController>().currentPage;
    return Get.previousRoute == AppRoute.shoppingCart || page.value == 2;
  }

  showDialogMessageOfAddToCard(bool success) {}

  @override
  void onInit() {
    initialData();
    restFavorite = RestFavorite();
    restItemDetails = RestItemDetails();
    addToCartStatusRequest = StatusRequest();
    redirect = ItemDetailsRedirects(this);
    super.onInit();
  }
}
