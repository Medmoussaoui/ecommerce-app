import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordVerifyCodeController extends GetxController {
  String verifyCode = "";
  late String email;
  StatusRequest statusRequest = StatusRequest();
  final restForgetPassword = Get.find<RestForgetPassword>();

  onVerify(String? code) async {
    verifyCode = code ?? verifyCode;
    if (statusRequest.isLoading || verifyCode.length != 4) return;
    statusRequest.loading();
    update();
    statusRequest = await restForgetPassword.verifyCode(
      Get.arguments['user_email'],
      verifyCode,
    );
    if (statusRequest.isSuccess) {
      redirectToResetPassword();
      return;
    }
    if (statusRequest.isRespondError) {
      customAttentionDialogSheet(
        title: "Invalid Digits",
        subTitle: "Plesae enter valid Digits you recieved on your email",
        icon: const Icon(
          Icons.password_rounded,
          color: Colors.red,
        ),
      );
    }
    update();
  }

  resendCode() {}

  redirectToResetPassword() {
    Get.toNamed(AppRoute.resetPassword, arguments: Get.arguments);
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
  }
}
