import 'package:ecommercecourse/view/widget/shipping/drop_down_menu.dart';
import 'package:ecommercecourse/view/widget/shipping/zip_code.dart';
import 'package:flutter/material.dart';

class ShippingCityAndZipCode extends StatelessWidget {
  const ShippingCityAndZipCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: ShippingDropDownMenu(
            title: "City",
            hintText: "Select city",
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: ShippingZipCode(),
        ),
      ],
    );
  }
}
