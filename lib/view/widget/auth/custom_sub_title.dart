import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  final String subtitle;
  final TextAlign textAlign;
  final TextStyle? style;

  const CustomSubTitle({Key? key, this.style, this.textAlign = TextAlign.center, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    style ?? Theme.of(context).textTheme.bodyMedium;
    return Text(
      subtitle,
      textAlign: textAlign,
      style: style,
    );
  }
}
