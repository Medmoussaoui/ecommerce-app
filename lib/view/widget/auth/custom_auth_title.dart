import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;

  const CustomAuthTitle({
    Key? key,
    this.color,
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
          .copyWith(fontSize: fontSize, color: color),
    );
  }
}
