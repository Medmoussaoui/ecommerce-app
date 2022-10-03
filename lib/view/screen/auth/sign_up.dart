import 'package:ecommercecourse/controller/sign_up_controller.dart';
import 'package:ecommercecourse/core/class/form_input_validator.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_full_name_form.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22, right: 20, left: 20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(AppImageAsset.logo),
                ),
                const SizedBox(height: 22.0),
                CustomAuthTitle(title: "42".tr),
                const SizedBox(height: 30.0),
                Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      const CustomFullNameForm(),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        hintText: '22'.tr,
                        icon: Icons.email_rounded,
                        controller: controller.emailController,
                        validator: CustomformInputValidator.emailValidate,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        hintText: '23'.tr,
                        isSecure: true,
                        icon: Icons.lock_rounded,
                        controller: controller.passwordController,
                        validator: CustomformInputValidator.passwordValidate,
                      ),
                      SizedBox(height: Get.height / 13.6),
                      CustomPrimaryButton(
                        buttonText: '2'.tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      CustomOrDivider(text: '18'.tr),
                      const Padding(
                        padding: EdgeInsets.only(top: 22, bottom: 18.0),
                        child: CustomSignWith(),
                      ),
                      GuidanceText(
                        title: "19".tr,
                        tapText: "1".tr,
                        onTap: () {
                          controller.redirectToSignIn();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
