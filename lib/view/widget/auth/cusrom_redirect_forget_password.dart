import 'package:flutter/material.dart';

class CustomRedirectForgetPassword extends StatelessWidget {
  final Function()? onPressed;
  const CustomRedirectForgetPassword({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text('Forget password?'),
    );
  }
}
