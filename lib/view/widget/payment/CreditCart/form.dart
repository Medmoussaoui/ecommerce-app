import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCartCustomForm extends StatefulWidget {
  final String formTitle;
  final String hintText;
  final bool? radiusTop;
  final int maxTextLength;
  final bool isValid;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CreditCartCustomForm({
    Key? key,
    required this.controller,
    this.isValid = true,
    this.radiusTop,
    required this.maxTextLength,
    required this.formTitle,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CreditCartCustomForm> createState() => _CreditCartCustomFormState();
}

class _CreditCartCustomFormState extends State<CreditCartCustomForm> {
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    final String title = onTap || widget.isValid ? widget.formTitle : "! ${widget.formTitle}";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: onTap
                    ? AppColor.appBarColord
                    : widget.isValid
                        ? AppColor.appBarColord
                        : Colors.red,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            onTap: () async {
              setState(() => onTap = true);
              await Future.delayed(const Duration(milliseconds: 100));
              onTap = false;
            },
            controller: widget.controller,
            onChanged: widget.onChanged,
            maxLength: widget.maxTextLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.appBarColord,
                ),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: widget.radiusTop == true ? const Radius.circular(10) : Radius.zero,
                  bottomRight: widget.radiusTop == false ? const Radius.circular(10) : Radius.zero,
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
