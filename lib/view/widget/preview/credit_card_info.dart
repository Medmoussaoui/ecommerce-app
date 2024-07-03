import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';

import 'package:flutter/material.dart';

class CreditCardInfoPreview extends StatelessWidget {
  const CreditCardInfoPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImageAsset.mastercard, width: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  radius: 1.5,
                ),
              ),
            ),
          ),
        ),
        const CustomAuthTitle(title: "4587", fontSize: 15),
        const Spacer(),
        const CustomSubTitle(subtitle: "01/25"),
      ],
    );
  }
}
