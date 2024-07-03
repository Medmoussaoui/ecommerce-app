import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';

class ShippingDropDownMenu extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? value;

  const ShippingDropDownMenu({
    Key? key,
    required this.title,
    this.hintText,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hint = value ?? hintText ?? "select";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: CustomSubTitle(
            subtitle: title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 7.0),
        // Drop down menu item
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.grey1, width: 0.5),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Row(
            children: [
              Text(
                hint,
                style: TextStyle(
                  color: value == null ? AppColor.grey1 : Colors.black,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColor.grey1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
