import 'package:ecommercecourse/controller/auth/sign_in_controller.dart';
import 'package:ecommercecourse/core/class/form_input_validator.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/functions/confirm_exit_app_dialog.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/cusrom_redirect_forget_password.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: confirmExitApp,
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  right: 20,
                  left: 20,
                  bottom: 7.5,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(AppImageAsset.logo),
                    ),
                    const SizedBox(height: 22.0),
                    GetBuilder<SignInController>(builder: (con) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        opacity: con.statusRequest.isLoading ? 0.4 : 1.0,
                        child: IgnorePointer(
                          ignoring: con.statusRequest.isLoading,
                          child: Column(
                            children: [
                              CustomAuthTitle(title: "20".tr),
                              const SizedBox(height: 30.0),
                              Form(
                                key: controller.formState,
                                child: Column(
                                  children: [
                                    CustomTextFormAuth(
                                      hintText: '22'.tr,
                                      icon: Icons.email_rounded,
                                      controller: controller.emailAddess,
                                      validator: CustomformInputValidator
                                          .emailValidate,
                                    ),
                                    const SizedBox(height: 15),
                                    CustomTextFormAuth(
                                      hintText: '23'.tr,
                                      isSecure: true,
                                      icon: Icons.lock_rounded,
                                      controller: controller.password,
                                      validator: CustomformInputValidator
                                          .customValidate(
                                        name: "password",
                                        max: 15,
                                        min: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: CustomRedirectForgetPassword(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const Spacer(),
                    GetBuilder<SignInController>(builder: (con) {
                      return Opacity(
                        opacity: con.statusRequest.isLoading ? 0.9 : 1.0,
                        child: CustomPrimaryButton(
                          buttonText: '1'.tr,
                          onPressed: controller.signIn,
                          child: con.statusRequest.isLoading
                              ? const CustomProgressIndicator(
                                  color: Colors.white)
                              : null,
                        ),
                      );
                    }),
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
      ),
    );
  }
}
