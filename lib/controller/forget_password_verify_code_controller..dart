import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:get/get.dart';

class ForgetPasswordVerifyCodeController extends GetxController {
  String verifyCode = "";

  onVerify(String code) {
    if (code == "1234") {
      redirectToResetPassword();
    }
  }

  redirectToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }
}
