import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomPrimaryButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 15.0),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
    );
  }
}
