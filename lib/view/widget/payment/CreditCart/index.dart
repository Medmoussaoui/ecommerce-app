import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/payment/CreditCart/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCreditCartInformation extends GetView<PaymentScreenContoller> {
  const PaymentCreditCartInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        CustomAuthTitle(title: "CARD DETAILS", fontSize: 17.0, color: AppColor.blackGrey),
        const Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 20),
          child: CustomSubTitle(
            subtitle: "Enter your debit or cridet card details",
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[400]!,
            ),
          ),
          child: Form(
            key: controller.creditCardFormController.formKey,
            child: GetBuilder<PaymentScreenContoller>(
              id: "credit card",
              builder: (con) {
                return Column(
                  children: [
                    CreditCartCustomForm(
                      controller: controller.creditCardFormController.cartNumber,
                      maxTextLength: 13,
                      radiusTop: true,
                      isValid: controller.creditCardFormController.cartNumberValid,
                      formTitle: "Cart no",
                      hintText: "000 000 000 000",
                    ),
                    Divider(
                      height: 0,
                      thickness: 1.0,
                      color: Colors.grey[400],
                    ),
                    CreditCartCustomForm(
                      controller: controller.creditCardFormController.expire,
                      maxTextLength: 7,
                      formTitle: "Expiry",
                      isValid: controller.creditCardFormController.expireValid,
                      hintText: "Manth / year",
                    ),
                    Divider(
                      height: 0,
                      thickness: 1.0,
                      color: Colors.grey[400],
                    ),
                    CreditCartCustomForm(
                      controller: controller.creditCardFormController.cvv,
                      maxTextLength: 3,
                      radiusTop: false,
                      isValid: controller.creditCardFormController.cvvValid,
                      formTitle: "CVV Code",
                      hintText: "000",
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
