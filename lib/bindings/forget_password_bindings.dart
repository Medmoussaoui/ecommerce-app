import 'package:ecommercecourse/controller/ForgetPassword/forget_password_controller.dart';
import 'package:ecommercecourse/controller/ForgetPassword/reset_password_controller.dart';
import 'package:ecommercecourse/controller/ForgetPassword/verify_code_controller.dart';
import 'package:ecommercecourse/data/source/remote/rest_forget_password.dart';
import 'package:get/get.dart';

class ForgetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestForgetPassword());
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => ForgetPasswordVerifyCodeController());
    Get.lazyPut(() => ResetPasswordController());
  }
}
