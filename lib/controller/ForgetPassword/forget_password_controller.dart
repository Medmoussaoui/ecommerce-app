import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailAddress;
  StatusRequest statusRequest = StatusRequest();
  late GlobalKey<FormState> formState;

  rediretToVerifyCode() {
    Get.toNamed(
      AppRoute.forgetPasswordVerifyCode,
      arguments: {"user_email": emailAddress.text},
    );
  }

  sendCode() async {
    if (statusRequest.isLoading) return;
    if (formState.currentState!.validate() == false) {
      return formState.currentState!.save();
    }
    statusRequest.loading();
    update();
    statusRequest = await RestForgetPassword.sendVerfycode(emailAddress.text);
    update();
    if (statusRequest.isSuccess) {
      rediretToVerifyCode();
      return;
    }
    if (statusRequest.isRespondError) {
      customAttentionDialogSheet(
        title: emailAddress.text,
        subTitle: "This email is not find try with other email address",
        icon: const Icon(
          Icons.gps_off_rounded,
          size: 30,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  void onInit() {
    emailAddress = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    emailAddress.dispose();
    super.dispose();
  }
}
