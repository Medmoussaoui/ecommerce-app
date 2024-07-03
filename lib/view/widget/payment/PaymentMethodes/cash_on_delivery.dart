import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCashOnDelivery extends GetView<PaymentScreenContoller> {
  final int value;
  final int groupValue;
  const PaymentCashOnDelivery({
    Key? key,
    required this.groupValue,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changePaymentMethode(value);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        color: Colors.white,
        child: Row(
          children: [
            const CustomAuthTitle(title: "Cash On Delivery", fontSize: 16),
            const Spacer(),
            Radio(
              activeColor: AppColor.primaryColor,
              value: value,
              groupValue: groupValue,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
