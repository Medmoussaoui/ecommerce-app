import 'package:ecommercecourse/controller/forget_password_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: Image.asset(
                    AppImageAsset.forgetPassword,
                    color: AppColor.primaryColor,
                    height: 90,
                    width: 90,
                  ),
                ),
                const Spacer(),
                const CustomAuthTitle(title: 'Forget Password'),
                const SizedBox(height: 15),
                const CustomSubTitle(
                  subtitle:
                      'Please enter your email address to receive a verification code',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                const CustomTextFormAuth(
                  hintText: 'example@email.com',
                  icon: Icons.email_rounded,
                ),
                const Spacer(flex: 3),
                CustomPrimaryButton(
                  bottomPadding: 20.0,
                  topPadding: 0.0,
                  buttonText: 'Send code',
                  onPressed: () {
                    controller.sendCode();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
