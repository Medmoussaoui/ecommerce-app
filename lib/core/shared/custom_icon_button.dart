import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final double height;
  final double width;
  final Color borderColor;
  final double borderRadius;
  final Color? color;
  final Icon icon;
  const CustomIconButton({
    Key? key,
    this.onPressed,
    this.height = 40,
    this.width = 40,
    this.borderRadius = 7.0,
    this.borderColor = Colors.white,
    this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon customIcon = Icon(
      icon.icon,
      color: icon.color ?? AppColor.grey1,
    );

    return MaterialButton(
      height: height,
      minWidth: width,
      elevation: 0.0,
      highlightElevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: BorderSide(color: borderColor, width: 0.2),
      ),
      color: color,
      onPressed: onPressed,
      child: customIcon,
    );
  }
}
