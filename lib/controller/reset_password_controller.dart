import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPasswordField;
  late TextEditingController confirmPasswordField;

  resetPassword() {
    redirectToSucssesScreen();
  }

  redirectToSucssesScreen() {
    Get.toNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    newPasswordField = TextEditingController();
    confirmPasswordField = TextEditingController();
    super.onInit();
  }
}
