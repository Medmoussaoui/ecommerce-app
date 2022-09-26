import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  final double? fontSize;

  const CustomAuthTitle({
    Key? key,
    required this.title,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontSize: fontSize),
    );
  }
}
