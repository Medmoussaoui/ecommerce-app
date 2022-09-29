import 'package:ecommercecourse/controller/verify_code_signup_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class SignUpVerifyCodeScreen extends StatelessWidget {
  const SignUpVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpController controller =
        Get.put(VerifyCodeSignUpController());

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
                    AppImageAsset.email,
                    height: 90,
                    width: 90,
                  ),
                ),
                const Spacer(),
                CustomAuthTitle(title: '30'.tr),
                const SizedBox(height: 15),
                CustomSubTitle(
                  subtitle: '31'.tr + ("\nmohamed@gmail.com"),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    fieldWidth: 50,
                    textStyle: const TextStyle(fontSize: 13),
                    numberOfFields: 4,
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(10.0),
                    fillColor: AppColor.grey.withOpacity(0.01),
                    filled: true,
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    keyboardType: TextInputType.phone,
                    onCodeChanged: (String code) {
                      controller.verifyCode += code;
                    },
                    onSubmit: (String verifyCode) {
                      controller.onVerify(verifyCode);
                    },
                  ),
                ),
                const SizedBox(height: 22.0),
                GuidanceText(
                  title: "32".tr,
                  tapText: '33'.tr,
                  onTap: () {
                    controller.resendCode();
                  },
                ),
                const Spacer(flex: 3),
                CustomPrimaryButton(
                  bottomPadding: 20.0,
                  topPadding: 0.0,
                  buttonText: '34'.tr,
                  onPressed: () {
                    controller.onVerify(controller.verifyCode);
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
