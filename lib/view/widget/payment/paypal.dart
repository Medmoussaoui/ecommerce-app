import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Paypal extends GetView<PaymentScreenContoller> {
  const Paypal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Image.asset(AppImageAsset.paypalTwo, width: 70),
        ),
        Form(
          key: controller.paypalController.formState,
          child: CustomTextFormAuth(
            controller: controller.paypalController.paypalEmail,
            validator: controller.paypalController.formValidation,
            filled: true,
            hintText: "Enter Paypal Email",
          ),
        )
      ],
    );
  }
}
