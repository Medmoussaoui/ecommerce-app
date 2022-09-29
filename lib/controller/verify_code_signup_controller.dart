import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpController extends GetxController {
  String verifyCode = "";

  onVerify(String code) {
    if (code == "1234") {
      redirectToSuccess();
    }
  }

  resendCode() {}

  redirectToSuccess() {
    Get.toNamed(AppRoute.successSignUp);
  }
}
