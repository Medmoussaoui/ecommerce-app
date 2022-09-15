import 'package:flutter/material.dart';

class CustomCirculIcon extends StatelessWidget {
  final String iconPath;
  const CustomCirculIcon({Key? key, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(iconPath),
    );
  }
}
