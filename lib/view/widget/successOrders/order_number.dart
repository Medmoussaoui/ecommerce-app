import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';

class OrderNumber extends StatelessWidget {
  const OrderNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustomAuthTitle(title: "Your order number: ", fontSize: 16, color: AppColor.appBarColord),
          CustomAuthTitle(
            title: "#5488 ",
            fontSize: 15,
            color: AppColor.grey,
          ),
        ],
      ),
    );
  }
}
