import 'package:flutter/material.dart';

class CustomSocialMediaIcon extends StatelessWidget {
  final String iconPath;
  final void Function()? onPressed;

  const CustomSocialMediaIcon({
    Key? key,
    required this.iconPath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(12.0),
      highlightElevation: 2.0,
      minWidth: 50,
      height: 50,
      elevation: 0.0,
      shape: CircleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      color: Colors.white,
      child: Image.asset(iconPath, width: 28.0, height: 28.0),
    );
  }
}
