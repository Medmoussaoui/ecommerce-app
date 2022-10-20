import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoute.homePage),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Center(
                child: Image.asset(
                  AppImageAsset.success,
                  height: 135,
                  width: 135,
                ),
              ),
              const Spacer(),
              CustomAuthTitle(title: '47'.tr),
              const SizedBox(height: 15),
              CustomSubTitle(
                subtitle: '46'.tr,
              ),
              const Spacer(flex: 3),
              const CustomProgressIndicator(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
