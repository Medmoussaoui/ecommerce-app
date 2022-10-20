import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/data/source/remote/rest_signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailAddess;
  late TextEditingController password;
  late GlobalKey<FormState> formState;
  StatusRequest statusRequest = StatusRequest();
  RestSignIn restSignIn = RestSignIn();

  signIn() async {
    if (statusRequest.isLoading) return;
    if (formState.currentState!.validate() == false) {
      formState.currentState!.save(); // to make form Faild auto validate
      return;
    }
    statusRequest.loading();
    update();
    statusRequest = await restSignIn.signIn(
      emailAddess.text,
      password.text,
    );
    if (statusRequest.isSuccess) {
      return redirectToHomePage();
    }
    if (statusRequest.isRespondError) {
      customAttentionDialogSheet(
        title: "Sign in failed",
        subTitle: "Your Email or Password is invalid",
        icon: Icon(null, color: Colors.red),
      );
    }
    update();
  }

  redirectToHomePage() {
    Get.offNamed(AppRoute.homePage);
  }

  redirectToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  redirectToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    emailAddess = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailAddess.dispose();
    password.dispose();
    super.dispose();
  }
}
