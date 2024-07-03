import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';

class ShippingFirstNameAndLastName extends StatelessWidget {
  const ShippingFirstNameAndLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: CustomSubTitle(
                  subtitle: "First name",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: CustomSubTitle(
                  subtitle: "Last name",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7.0),

        /// Forms
        Row(
          children: const [
            Expanded(
              child: CustomTextFormAuth(
                hintText: "name",
                initialValue: "mohamed",
                filled: true,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomTextFormAuth(
                filled: true,
                initialValue: "moussaoui",
                hintText: "name",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
