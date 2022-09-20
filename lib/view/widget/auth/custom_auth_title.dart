import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const CustomAuthTitle({
    Key? key,
    required this.title,
    this.fontSize = 37.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'FredokaOne',
        color: AppColor.blackGrey,
      ),
    );
  }
}
