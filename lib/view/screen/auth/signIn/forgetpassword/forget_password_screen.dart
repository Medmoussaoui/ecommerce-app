import 'package:ecommercecourse/controller/ForgetPassword/forget_password_controller.dart';
import 'package:ecommercecourse/core/class/form_input_validator.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
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
                GetBuilder<ForgetPasswordController>(builder: (con) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    opacity: con.statusRequest.isLoading ? 0.4 : 1,
                    child: Column(
                      children: [
                        CustomAuthTitle(title: '27'.tr),
                        const SizedBox(height: 15),
                        CustomSubTitle(
                          subtitle: '28'.tr,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40.0),
                        Form(
                          key: con.formState,
                          child: CustomTextFormAuth(
                            enable: !con.statusRequest.isLoading,
                            controller: controller.emailAddress,
                            hintText: 'example@email.com',
                            icon: Icons.email_rounded,
                            validator: CustomformInputValidator.emailValidate,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const Spacer(flex: 3),
                GetBuilder<ForgetPasswordController>(builder: (con) {
                  return Opacity(
                    opacity: con.statusRequest.isLoading ? 0.9 : 1.0,
                    child: CustomPrimaryButton(
                      bottomPadding: 20.0,
                      topPadding: 0.0,
                      buttonText: '29'.tr,
                      onPressed: controller.sendCode,
                      child: con.statusRequest.isLoading
                          ? const CustomProgressIndicator(color: Colors.white)
                          : null,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
