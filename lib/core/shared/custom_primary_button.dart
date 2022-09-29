import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Widget? child;
  final double topPadding;
  final double bottomPadding;
  final void Function()? onPressed;

  const CustomPrimaryButton({
    Key? key,
    this.onPressed,
    this.child,
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
        height: 57,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: child ??
            Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
      ),
    );
  }
}
