import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';

class PaypalInfoPreview extends StatelessWidget {
  const PaypalInfoPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImageAsset.paypal, width: 50),
        const Spacer(),
        const CustomAuthTitle(title: "mou", fontSize: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
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
        const CustomAuthTitle(title: "@gmail.com", fontSize: 15),
      ],
    );
  }
}
