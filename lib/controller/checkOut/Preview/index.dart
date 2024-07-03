import 'package:ecommercecourse/controller/checkOut/Preview/animation.dart';
import 'package:ecommercecourse/controller/checkOut/index.dart';
import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/controller/checkOut/shipping/index.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController {
  late PreviewScreenAnimationController animation;

  editShippingInfo() {
    final checkOutViewRef = Get.find<ChekOutViewController>();
    final shipping = Get.find<ShippingController>();
    shipping.activeUpdateMode();
    checkOutViewRef.nextScreen(page: 0); // 0 is Shipping Screen
  }

  editPaymentInfo() {
    final ref = Get.find<ChekOutViewController>();
    final payment = Get.find<PaymentScreenContoller>();
    payment.activeUpdateMode();
    ref.nextScreen(page: 1); // 1 is Payment Screen
  }

  submitOrder() async {
    await animation.startAnimationCloseScreen();
    Get.find<ChekOutViewController>().nextScreen();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    animation = PreviewScreenAnimationController();
    super.onInit();
  }
}
