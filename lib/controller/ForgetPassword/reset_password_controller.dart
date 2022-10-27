import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  late GlobalKey<FormState> formState;

  StatusRequest statusRequest = StatusRequest();
  get isPasswordMatched => (newPassword.text == confirmPassword.text);

  resetPassword() async {
    if (statusRequest.isLoading) return;

    if (formState.currentState!.validate() == false) {
      return formState.currentState!.save();
    }

    if (isPasswordMatched == false) {
      return customAttentionDialogSheet(
        title: "Password not matched",
        subTitle: "Please make sure that password be matched in both forms",
        icon: const Icon(
          Icons.password_rounded,
          color: Colors.red,
        ),
      );
    }

    statusRequest.loading();
    update();
    statusRequest = await RestForgetPassword.resetPassword(
      "token_access",
      Get.arguments['user_email'],
      newPassword.text,
    );

    if (statusRequest.isSuccess) {
      redirectToSucssesScreen();
      return;
    }
    update();
  }

  redirectToSucssesScreen() {
    Get.offAllNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }
}
