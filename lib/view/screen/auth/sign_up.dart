import 'package:ecommercecourse/controller/sign_up_controller.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_full_name_form.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, right: 20, left: 20, bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppImageAsset.logo),
                  ),
                  const SizedBox(height: 25.0),
                  const CustomAuthTitle(title: "Let's Sign up", fontSize: 24.0),
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomSubTitle(
                        subtitle:
                            'Create an account by custom email or sign with social media '),
                  ),
                  const SizedBox(height: 40.0),
                  const CustomFullNameForm(),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    hintText: 'Enter email address',
                    icon: Icons.email_rounded,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    hintText: 'Enter password',
                    isSecure: true,
                    icon: Icons.lock_rounded,
                    controller: controller.passwordController,
                  ),
                  const Spacer(),
                  CustomPrimaryButton(
                    buttonText: 'Sign up',
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const CustomOrDivider(text: 'or Sign In with'),
                  const Padding(
                    padding: EdgeInsets.only(top: 22, bottom: 18.0),
                    child: CustomSignWith(),
                  ),
                  GuidanceText(
                    title: "I aready have an account",
                    tapText: 'Sign in',
                    onTap: () {
                      Get.toNamed(AppRoute.signIn);
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