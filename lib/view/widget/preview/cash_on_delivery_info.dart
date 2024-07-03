import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';

class CashOnDeliveryInfoPreview extends StatelessWidget {
  const CashOnDeliveryInfoPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImageAsset.cashOnDelivery, width: 30),
        const Spacer(),
        const CustomAuthTitle(title: "Cash On Delivery", fontSize: 15),
      ],
    );
  }
}
