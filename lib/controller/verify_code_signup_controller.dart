import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpController extends GetxController {
  StatusRequest statusRequestVerify = StatusRequest();
  StatusRequest statusRequestResendCode = StatusRequest();
  final restSignUp = Get.find<RestSignUp>();

  String verifyCode = "";
  late String email;

  onVerify(String? code) async {
    code = code ?? verifyCode;
    if (statusRequestVerify.isLoading || code.length != 4) return;
    statusRequestVerify.loading();
    update();
    await Future.delayed(const Duration(milliseconds: 700));
    statusRequestVerify = await restSignUp.verifyCode(email, code);
    if (statusRequestVerify.isSuccess) {
      return redirectToSuccess();
    }
    if (statusRequestVerify.isRespondError) {
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

  resendCode() async {
    statusRequestResendCode.loading();
    update();
    statusRequestResendCode = await restSignUp.sendVerifyCode(email);
    update();
  }

  redirectToSuccess() {
    Get.toNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
  }
}
