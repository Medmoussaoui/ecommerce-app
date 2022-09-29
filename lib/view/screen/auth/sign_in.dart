import 'package:ecommercecourse/controller/sign_in_controller.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/cusrom_redirect_forget_password.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(SignInController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, right: 20, left: 20, bottom: 5.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppImageAsset.logo),
                  ),
                  const SizedBox(height: 22.0),
                  CustomAuthTitle(title: "20".tr),
                  const Spacer(),
                  CustomTextFormAuth(
                    hintText: '22'.tr,
                    icon: Icons.email_rounded,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    hintText: '23'.tr,
                    isSecure: true,
                    icon: Icons.lock_rounded,
                    controller: controller.passwordController,
                  ),
                  const SizedBox(height: 5.0),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomRedirectForgetPassword(),
                  ),
                  const Spacer(),
                  CustomPrimaryButton(
                    buttonText: '1'.tr,
                    onPressed: () {
                      controller.signIn();
                    },
                  ),
                  CustomOrDivider(text: '24'.tr),
                  const Padding(
                    padding: EdgeInsets.only(top: 22, bottom: 18.0),
                    child: CustomSignWith(),
                  ),
                  GuidanceText(
                    title: "25".tr,
                    tapText: '2'.tr,
                    onTap: () {
                      controller.redirectToSignUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
