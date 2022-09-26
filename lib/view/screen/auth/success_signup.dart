import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              const CustomAuthTitle(
                title: 'Well Done!',
                fontSize: 21.0,
              ),
              const SizedBox(height: 15),
              const CustomSubTitle(
                subtitle:
                    'Your account has been created successfuly press goo to visit your account',
              ),
              const Spacer(flex: 2),
              CustomPrimaryButton(
                bottomPadding: 20.0,
                topPadding: 0.0,
                buttonText: 'Goo',
                onPressed: () {
                  Get.toNamed(AppRoute.signIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
