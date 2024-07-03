import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentViaCreditCart extends GetView<PaymentScreenContoller> {
  final int value;
  final int groupValue;

  const PaymentViaCreditCart({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImageAsset.visa,
              height: 39,
            ),
            Image.asset(
              AppImageAsset.mastercard,
              height: 39,
            ),
            Image.asset(
              AppImageAsset.amex,
              height: 35,
            ),
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
