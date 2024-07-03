import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentViaPaypal extends GetView<PaymentScreenContoller> {
  final int value;
  final int groupValue;

  const PaymentViaPaypal({
    required this.groupValue,
    Key? key,
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
            Image.asset(AppImageAsset.paypal),
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
