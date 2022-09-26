import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  static SignInController instance = Get.find<SignInController>();

  signIn() {
    print("email ==> " + emailController.value.text);
    print("password ==> " + passwordController.value.text);
  }

  redirectToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  redirectToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
