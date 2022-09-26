import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomOrDivider extends StatelessWidget {
  final String text;
  const CustomOrDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
        Expanded(child: Divider(color: Colors.grey[400])),
      ],
    );
  }
}
