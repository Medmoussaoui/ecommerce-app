import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailAddress;

  rediretToVerifyCode() {
    Get.toNamed(AppRoute.forgetPasswordVerifyCode);
  }

  sendCode() {
    rediretToVerifyCode();
  }

  @override
  void onInit() {
    emailAddress = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailAddress.dispose();
    super.dispose();
  }
}
