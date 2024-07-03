import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController lastName;
  late TextEditingController firstName;
  late TextEditingController emailAddress;
  late TextEditingController password;
  late GlobalKey<FormState> formState;
  StatusRequest statusRequest = StatusRequest();

  final restSignUp = Get.find<RestSignUp>();

  signUp() async {
    if (statusRequest.isLoading) return;

    if (formState.currentState!.validate() == false) {
      formState.currentState!.save(); // to make form Faild auto validate
      return;
    }

    statusRequest.loading();
    update();
    statusRequest = await restSignUp.signUp(
      firstName.text,
      lastName.text,
      emailAddress.text,
      password.text,
    );
    update();

    if (statusRequest.isSuccess) {
      return redirectToVrifyCode();
    }

    if (statusRequest.isRespondError) {
      customAttentionDialogSheet(
        title: emailAddress.text,
        subTitle:
            "This email Aready taken please chose other email to continue",
      );
    }
  }

  redirectToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  redirectToVrifyCode() {
    Get.toNamed(
      AppRoute.verifyCodeSignUp,
      arguments: {"user_email": emailAddress.text},
    );
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    firstName = TextEditingController();
    lastName = TextEditingController();
    emailAddress = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    emailAddress.dispose();
    password.dispose();
    super.dispose();
  }
}
