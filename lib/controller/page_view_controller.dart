import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomPageViewController extends GetxController {
  late PageController pageViewcController;

  RxInt currentPage = 0.obs;

  onPageChange(int index) {
    currentPage.value = index;
    pageViewcController.animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void onInit() {
    pageViewcController = PageController();
    super.onInit();
  }
}
