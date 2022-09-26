import 'package:ecommercecourse/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRedirectForgetPassword extends GetView<SignInController> {
  const CustomRedirectForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: controller.redirectToForgetPassword,
      child: const Text('Forget password?'),
    );
  }
}
