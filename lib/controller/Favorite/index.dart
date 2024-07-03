import 'package:ecommercecourse/controller/Favorite/favorite_remove_item.dart';
import 'package:ecommercecourse/controller/Favorite/get_items.dart';
import 'package:ecommercecourse/controller/Favorite/get_items_on_scrolling.dart';
import 'package:ecommercecourse/controller/Favorite/refresh.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/data/source/remote/rest_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  bool buildScreen = false;

  late StatusRequest statusRequest;
  List<ItemModule> items = [];

  bool get isLoadingItemsInScrolling => statusRequest.isLoading && items.isNotEmpty;

  late ScrollController scrollController;

  late GlobalKey<AnimatedListState> animatedListKey;

  int loadingOffset = 0;

  RestFavorite restFavorite = RestFavorite();

  void itemDecoderAndInsert(List<dynamic> remoteItems, {loader = false}) {
    for (var item in remoteItems) {
      items.add(ItemModule.fromJeson(item));
      if (loader) animatedListKey.currentState!.insertItem(items.length - 1);
    }
  }

  void getItems() {
    FavoriteGetItems(this).getItems();
  }

  void loadItemsOnScrolling() async {
    FavoriteGetItemsOnScrolling(this).onScrolling();
  }

  void refreshItems() {
    FavoriteRefreshItems(this).refresh();
  }

  void removeItem(int index) async {
    FavoriteRemoveItem().removeItem(index);
  }

  void removeLocale(int itemId) {
    items.removeWhere((element) => element.itemId == itemId);
  }

  addItem(ItemModule item) {
    items.add(item);
  }

  redirectToItemDetails(int index) {
    Get.toNamed(AppRoute.itemDetailsScreen, arguments: {
      "item": items[index],
      "heroId": "FavorateScreen ${items[index].itemId}",
    });
  }

  @override
  void onInit() {
    animatedListKey = GlobalKey<AnimatedListState>();
    scrollController = ScrollController();
    scrollController.addListener(() => loadItemsOnScrolling());
    statusRequest = StatusRequest();
    super.onInit();
  }
}
