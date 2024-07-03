import 'package:ecommercecourse/controller/ForgetPassword/reset_password_controller.dart';
import 'package:ecommercecourse/core/class/form_input_validator.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/functions/confirm_exit_app_dialog.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();
    return Scaffold(
      body: WillPopScope(
        onWillPop: confirmExitApp,
        child: SingleChildScrollView(
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
                      AppImageAsset.resetPassword,
                      color: AppColor.primaryColor,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const Spacer(),
                  GetBuilder<ResetPasswordController>(builder: (con) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      opacity: con.statusRequest.isLoading ? 0.4 : 1.0,
                      child: Form(
                        key: con.formState,
                        child: Column(
                          children: [
                            CustomAuthTitle(title: '35'.tr),
                            const SizedBox(height: 15),
                            CustomSubTitle(
                              subtitle: '36'.tr,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40.0),
                            CustomTextFormAuth(
                              enable: !con.statusRequest.isLoading,
                              hintText: '37'.tr,
                              icon: Icons.lock_rounded,
                              isSecure: true,
                              controller: controller.newPassword,
                              validator:
                                  CustomformInputValidator.passwordValidate,
                            ),
                            const SizedBox(height: 15),
                            CustomTextFormAuth(
                              enable: !con.statusRequest.isLoading,
                              hintText: '38'.tr,
                              icon: Icons.lock_rounded,
                              isSecure: true,
                              controller: controller.confirmPassword,
                              validator:
                                  CustomformInputValidator.passwordValidate,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const Spacer(flex: 3),
                  GetBuilder<ResetPasswordController>(builder: (con) {
                    return Opacity(
                      opacity: con.statusRequest.isLoading ? 0.9 : 1.0,
                      child: CustomPrimaryButton(
                        bottomPadding: 20.0,
                        topPadding: 0.0,
                        buttonText: '39'.tr,
                        onPressed: controller.resetPassword,
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
      ),
    );
  }
}
