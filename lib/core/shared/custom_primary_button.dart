import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Widget? child;
  final double topPadding;
  final double bottomPadding;
  final double height;
  final Color? color;
  final Color textColor;
  final void Function()? onPressed;

  const CustomPrimaryButton({
    Key? key,
    this.onPressed,
    this.child,
    this.color,
    this.height = 57,
    this.textColor = Colors.white,
    this.bottomPadding = 22,
    this.topPadding = 0.0,
    this.buttonText = 'untitled',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
      child: MaterialButton(
        disabledColor: AppColor.grey.withOpacity(0.1),
        height: height,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: color ?? AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: child ??
            Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
      ),
    );
  }
}
