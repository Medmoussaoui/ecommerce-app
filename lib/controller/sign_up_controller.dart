import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController lastNameController;
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formState;

  signUp() {
    //redirectToVrifyCode();
    final state = formState.currentState;
    if (!state!.validate()) {
      state.save();
    }
  }

  redirectToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  redirectToVrifyCode() {
    Get.toNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
