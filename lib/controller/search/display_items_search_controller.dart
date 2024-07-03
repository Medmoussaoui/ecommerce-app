import 'package:ecommercecourse/controller/search/display_items_search_redirects.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/data/source/remote/rest_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DisplayItemsSearchScreenController extends GetxController {
  late ScrollController scrollController;
  StatusRequest itemsStatusRequest = StatusRequest();
  List<ItemModule> items = [];
  int loadIndex = 0;
  late String searchInput;

  late RestHome restHome;
  late DisplayItemsSearchRedirect redirect;

  getItems() async {
    itemsStatusRequest.loading();
    update();
    await Future.delayed(const Duration(seconds: 3)); // for test
    itemsStatusRequest = await restHome.loadProducts(
      searchInput,
      loadIndex,
      "",
    );
    items.addAll(List.from(itemsStatusRequest.data));
    update();
  }

  loadItemsOnScrolling() async {
    double rangeStartLoadingData = scrollController.position.maxScrollExtent - 30;
    if (scrollController.position.pixels <= rangeStartLoadingData) return;
    if (itemsStatusRequest.isLoading) return;
    getItems();
  }

  @override
  void onInit() {
    restHome = RestHome();
    redirect = DisplayItemsSearchRedirect();
    searchInput = Get.arguments['searchInput'];
    scrollController = ScrollController();
    scrollController.addListener(() => loadItemsOnScrolling());
    getItems();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
