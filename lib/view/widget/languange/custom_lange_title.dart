import 'package:ecommercecourse/core/constant/app_fonts.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangTitle extends StatelessWidget {
  const CustomLangTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '3'.tr,
      style: TextStyle(
        fontSize: 20.5,
        fontWeight: FontWeight.w600,
        color: AppColor.blackGrey,
      ),
    );
  }
}
