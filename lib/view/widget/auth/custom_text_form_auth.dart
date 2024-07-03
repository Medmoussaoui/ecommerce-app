import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final bool isSecure;
  final IconData? icon;
  final TextEditingController? controller;
  final bool? enable;
  final bool? filled;
  final String? initialValue;
  final String? Function(String? input)? validator;
  const CustomTextFormAuth({
    Key? key,
    this.controller,
    this.filled,
    this.initialValue,
    required this.hintText,
    this.isSecure = false,
    this.enable,
    this.validator,
    this.icon,
  }) : super(key: key);

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {
  bool showPassword = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.enable,
        onSaved: (input) {
          if (!isSaved) {
            setState(() => isSaved = true);
          }
        },
        obscureText: widget.isSecure && !showPassword,
        autovalidateMode: isSaved ? AutovalidateMode.always : null,
        decoration: InputDecoration(
          filled: widget.filled,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(
              width: 0.5,
              color: AppColor.grey1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              width: 1.0,
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
      ),
    );
  }
}
