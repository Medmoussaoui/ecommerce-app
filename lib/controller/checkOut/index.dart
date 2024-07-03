import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/controller/checkOut/shipping/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChekOutViewController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  int? _willPopWithUpateMode() {
    final shipping = Get.find<ShippingController>();
    if (shipping.updateMode) {
      shipping.desactiveUpdateMode();
      return 2; // Preview Screen
    }

    final payment = Get.find<PaymentScreenContoller>();
    if (payment.updateMode) {
      payment.desactiveUpdateMode();
      return 2; // Preview Screen
    }
    // No update mode
    return null;
  }

  void nextScreen({int? page}) {
    if (page == null) currentPage++;
    pageController.jumpToPage(page ?? currentPage.value);
  }

  Future<bool> willPop() async {
    int? previewScreen = _willPopWithUpateMode();
    if (currentPage.value == 0) return true;
    if (previewScreen == null) currentPage--;
    pageController.jumpToPage(previewScreen ?? currentPage.value);
    return false;
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
