import 'package:ecommercecourse/data/module/custom_navigation_item_bottom.dart';
import 'package:ecommercecourse/view/widget/customPageView/custom_shopping_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageViewController extends GetxController {
  late PageController pageViewcController;
  RxInt currentPage = 0.obs;

  List<CustomNavigationItemBottom> navigationBottomItems = [
    CustomNavigationItemBottom(title: "49".tr, icon: const Icon(Icons.home_rounded)),
    CustomNavigationItemBottom(title: "50".tr, icon: const Icon(Icons.favorite_outline_rounded)),
    CustomNavigationItemBottom(title: "51".tr, icon: const ShoppingCartIconCount()),
    CustomNavigationItemBottom(title: "52".tr, icon: const Icon(Icons.track_changes_outlined)),
  ];

  onPageChange(int index) {
    currentPage.value = index;
    pageViewcController.jumpToPage(index);
  }

  bool onPop() {
    bool posibleToBackHome = currentPage.value != 0;
    if (posibleToBackHome) {
      currentPage.value = 0;
      pageViewcController.jumpToPage(currentPage.value);
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    pageViewcController = PageController();
    super.onInit();
  }
}
