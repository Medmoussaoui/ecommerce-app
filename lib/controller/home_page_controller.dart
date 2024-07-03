import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/category_module.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/data/source/remote/rest_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  List<ItemModule> items = [];
  List<CategoryModule> categorys = [];
  int selectedCategory = -0;

  bool get initialDataSuccess => itemsStatusRequest.isSuccess;

  late ScrollController scrollController;
  RestHome restHome = RestHome();

  late StatusRequest itemsStatusRequest;
  late StatusRequest categorysStatusRequest;

  initialHomeLoadingState() {
    itemsStatusRequest.loading();
    categorysStatusRequest.loading();
    update(['body', 'categorys']);
  }

  initialHomeData() async {
    initialHomeLoadingState();

    await Future.delayed(const Duration(seconds: 3));
    final statusRequest = await restHome.initialHome();

    if (statusRequest.isSuccess) {
      // items data
      items = List.from(statusRequest.data["items"]);
      // categories data
      categorys.addAll(List.from(statusRequest.data["categorys"]));
      statusRequest.data = [];
    }

    itemsStatusRequest = statusRequest;
    categorysStatusRequest = statusRequest;
    update(['body', 'categorys']);
  }

  onSelectCategory(int id) {
    if (id == selectedCategory) return;
    selectedCategory = id;
    update(["categorys"]);
    items = [];
    getItems();
  }

  getItems() async {
    itemsStatusRequest = StatusRequest().loading();
    update(["body"]);

    await Future.delayed(const Duration(seconds: 3));
    final categoryId = (selectedCategory == -0) ? "" : selectedCategory.toString();
    itemsStatusRequest = await restHome.loadProducts("", 0, categoryId);
    items.addAll(List.from(itemsStatusRequest.data));
    update(["body"]);
  }

  loadItemsOnScrolling() async {
    double rangeStartLoadingData = scrollController.position.maxScrollExtent - 30;
    if (scrollController.position.pixels <= rangeStartLoadingData) return;
    if (itemsStatusRequest.isLoading) return;
    getItems();
  }

  redirectToItemDetails(ItemModule item) {
    Get.toNamed(AppRoute.itemDetailsScreen, arguments: {
      "item": item,
      "heroId": "homeScreen ${item.itemId}",
    });
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    itemsStatusRequest = StatusRequest();
    categorysStatusRequest = StatusRequest();

    categorys.add(CategoryModule(
      name: "All",
      nameAr: "الكل",
      id: -0,
      categoryCreate: '',
    ));
    scrollController.addListener(() => loadItemsOnScrolling());
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
