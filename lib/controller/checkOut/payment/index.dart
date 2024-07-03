import 'package:ecommercecourse/controller/checkOut/index.dart';
import 'package:ecommercecourse/controller/checkOut/payment/animation.dart';
import 'package:ecommercecourse/controller/checkOut/payment/credit_card.dart';
import 'package:ecommercecourse/controller/checkOut/payment/paypal_controller.dart';
import 'package:get/get.dart';

class PaymentScreenContoller extends GetxController {
  late PaymentScreenAnimationController animation;
  RxInt paymentMethode = RxInt(1);

  late final CreditCardFormController creditCardFormController;
  late final PaypalController paypalController;
  late final ChekOutViewController chekOutViewController;

  bool updateMode = false;
  activeUpdateMode() => updateMode = true;
  desactiveUpdateMode() => updateMode = false;

  void changePaymentMethode(int value) {
    paymentMethode.value = value;
    update();
  }

  void continueToPreview() async {
    if (paymentMethode.value == 2) if (!paypalController.validate()) return;
    if (paymentMethode.value == 3) if (!creditCardFormController.validateInput()) return;
    await animation.startAnimationCloseScreen();

    if (updateMode) {
      desactiveUpdateMode();
      return chekOutViewController.nextScreen(page: 2);
    }
    return chekOutViewController.nextScreen();
  }

  @override
  void onInit() {
    creditCardFormController = CreditCardFormController(this);
    paypalController = PaypalController();
    animation = PaymentScreenAnimationController();
    chekOutViewController = Get.find<ChekOutViewController>();
    super.onInit();
  }

  @override
  void onClose() {
    creditCardFormController.dispose();
    paypalController.dispose();
    animation.dispose();
    super.onClose();
  }
}
