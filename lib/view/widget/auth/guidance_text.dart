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
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.all(5.0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onTap,
          child: Text(
            tapText,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
