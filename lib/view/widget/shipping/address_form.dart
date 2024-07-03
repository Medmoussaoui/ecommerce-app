import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';

class ShippingAddressForm extends StatelessWidget {
  const ShippingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: CustomSubTitle(
            subtitle: "Address",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 7.0),
        const CustomTextFormAuth(
          filled: true,
          hintText: "enter street name and apartment N",
        ),
      ],
    );
  }
}
