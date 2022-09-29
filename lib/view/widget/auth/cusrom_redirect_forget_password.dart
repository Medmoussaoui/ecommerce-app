import 'package:ecommercecourse/controller/sign_in_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRedirectForgetPassword extends GetView<SignInController> {
  const CustomRedirectForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: controller.redirectToForgetPassword,
      child: Text(
        '26'.tr,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColor.primaryColor,
            ),
      ),
    );
  }
}
