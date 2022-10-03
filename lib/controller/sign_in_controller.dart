import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formState;

  static SignInController instance = Get.find<SignInController>();

  signIn() {
    final state = formState.currentState!;
    if (!state.validate()) {
      state.save();
    }
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
    formState = GlobalKey<FormState>();
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
