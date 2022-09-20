import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class GuidanceText extends StatelessWidget {
  const GuidanceText({
    Key? key,
    required this.title,
    required this.tapText,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String tapText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColor.grey.withOpacity(0.4),
            fontSize: 14.0,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.all(5.0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onTap,
          child: Text(
            tapText,
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
