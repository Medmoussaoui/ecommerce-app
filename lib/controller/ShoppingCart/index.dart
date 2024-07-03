import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/controller/ShoppingCart/check_out.dart';
import 'package:ecommercecourse/controller/ShoppingCart/get_items.dart';
import 'package:ecommercecourse/controller/ShoppingCart/get_items_scrolling.dart';
import 'package:ecommercecourse/controller/ShoppingCart/redirects.dart';
import 'package:ecommercecourse/controller/ShoppingCart/refresh.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:ecommercecourse/data/source/remote/rest_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppringCartController extends GetxController {
  List<ShoppingCartItem> items = [];

  late StatusRequest statusGetItems;
  late StatusRequest statusLoadingItems;

  late RestShoppingCart restShoppingCart;
  late ScrollController listViewController;
  late ShoppingCartRedirects redirect;
  late ShoppingCartCheckOutController checkOut;

  // check Out Properties
  RxDouble total = 0.0.obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble get finalTotal => RxDouble(total.value - totalDiscount.value);

  // increse to load 10 items every scrolling
  int pageIndex = 0;

  void addItemFromItemDetails(ShoppingCartItem item) {
    items.add(item);
    checkOut.incrementItem(item);
    statusGetItems.data = items;
    update(["cartIcon"]);
  }

  itemDecoderAndInsert(List<dynamic> remoteItems) {
    for (var item in remoteItems) {
      items.add(ShoppingCartItem.fromJeson(item));
    }
    checkOut.initial();
  }

  getItems() {
    ShoppingCartGetItems(this).getItems();
  }

  refreshItems() {
    ShoppingCartRefreshItems(this).refresh();
  }

  getItemsOnScolling() async {
    ShoppingCartGetItemsOnScrolling(this).getItemsOnScrolling();
  }

  removeItem(int index) {
    restShoppingCart.removeItem(items[index].id);
    final removedItem = items.removeAt(index);

    removedItem.quantity = 1;
    checkOut.descrimentItem(removedItem);

    if (items.isEmpty) statusGetItems.data = [];
    update(["body", "cartIcon", "checkOut"]);
  }

  addToFavorite(int index) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(
        children: const [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 7.0),
          Text("item added to favorite"),
        ],
      ),
    );
    final favorite = Get.find<FavoriteController>();
    favorite.restFavorite.addToFavorite(items[index].itemId);
    // Add items in local List
    favorite.addItem(items[index]);
    // Show message to tell the item is added
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  updateQuantity(int index, int quantity) {
    final item = items[index];
    // check if quantity is incremented
    if (quantity > items[index].quantity) {
      item.quantity = 1;
      checkOut.incrementItem(item);
    } else {
      item.quantity = 1;
      checkOut.descrimentItem(item);
    }
    items[index].quantity = quantity;
    restShoppingCart.updateQuantity(items[index].id, quantity);
  }

  @override
  void onInit() {
    checkOut = ShoppingCartCheckOutController(this);
    statusGetItems = StatusRequest();
    statusLoadingItems = StatusRequest();
    restShoppingCart = RestShoppingCart();
    listViewController = ScrollController();
    redirect = ShoppingCartRedirects();
    listViewController.addListener(() => getItemsOnScolling());
    getItems();
    super.onInit();
  }

  @override
  void dispose() {
    listViewController.dispose();
    super.dispose();
  }
}
