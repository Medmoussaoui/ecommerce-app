import 'package:ecommercecourse/controller/checkOut/index.dart';
import 'package:ecommercecourse/controller/checkOut/shipping/animation.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController {
  late ShippingAnimation animation;

  bool updateMode = false;
  activeUpdateMode() => updateMode = true;
  desactiveUpdateMode() => updateMode = false;

  continueToPayment() async {
    ChekOutViewController ref = Get.find();
    await animation.startAnimationCloseScreen();
    if (updateMode) {
      desactiveUpdateMode();
      return ref.nextScreen(page: 2);
    }
    return ref.nextScreen();
  }

  updateInfo() {}

  @override
  void onInit() {
    animation = ShippingAnimation();
    super.onInit();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }
}
