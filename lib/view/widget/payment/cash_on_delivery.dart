import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/cupertino.dart';

class CashOnDelivery extends StatelessWidget {
  const CashOnDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Image.asset(AppImageAsset.cashOnDelivery, width: 80),
        ),
        const CustomSubTitle(subtitle: "You will pay when you receive \n your order"),
      ],
    );
  }
}
