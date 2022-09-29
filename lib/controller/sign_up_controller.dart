import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController lastNameController;
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  signUp() {
    redirectToVrifyCode();
  }

  redirectToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  redirectToVrifyCode() {
    Get.toNamed(AppRoute.signupVerifyEmail);
  }

  @override
  void onInit() {
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
