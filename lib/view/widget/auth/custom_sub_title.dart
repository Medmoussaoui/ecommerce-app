import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  final String subtitle;
  final TextAlign textAlign;
  const CustomSubTitle(
      {Key? key, this.textAlign = TextAlign.center, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
