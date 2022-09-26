import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final bool isSecure;
  final IconData? icon;
  final TextEditingController? controller;

  const CustomTextFormAuth({
    Key? key,
    this.controller,
    required this.hintText,
    this.isSecure = false,
    this.icon,
  }) : super(key: key);

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isSecure && !showPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 14.5, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColor.primaryColor.withOpacity(0.9),
          ),
        ),
        suffixIcon: widget.isSecure
            ? InkWell(
                borderRadius: BorderRadius.circular(200),
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  size: 22,
                ),
              )
            : null,
        prefixIconColor: AppColor.primaryColor,
        prefixIcon: widget.icon != null ? Icon(widget.icon, size: 22) : null,
      ),
    );
  }
}
