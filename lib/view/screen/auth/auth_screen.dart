import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
          child: Column(
            children: [
              CustomAuthTitle(title: "15".tr, fontSize: 35),
              const SizedBox(height: 30),
              CustomSubTitle(subtitle: '16'.tr),
              const Spacer(),
              CustomPrimaryButton(
                buttonText: '17'.tr,
                onPressed: () {},
              ),
              CustomOrDivider(text: '18'.tr),
              const Padding(
                padding: EdgeInsets.only(top: 22, bottom: 18.0),
                child: CustomSignWith(),
              ),
              GuidanceText(
                title: '19'.tr,
                tapText: '1'.tr,
                onTap: () {
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
