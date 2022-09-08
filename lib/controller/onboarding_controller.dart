import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt currentPage = 0.obs;

  late PageController pageController;

  bool syncanimateToPage = false;

  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }

  next() {
    if (currentPage.value == onBoardingList.length - 1) {
      return Get.toNamed(AppRoute.login);
    }
    currentPage++;
    syncanimateToPage = true;
    pageController
        .animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .then((value) => syncanimateToPage = false);
  }

  onSwipe(int index) {
    // false animate to page finish ; true animate to page not finish yet
    if (syncanimateToPage) return;
    currentPage.value = index;
  }
}
