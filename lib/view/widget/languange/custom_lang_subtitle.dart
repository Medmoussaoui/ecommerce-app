import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangSubtitle extends StatelessWidget {
  const CustomLangSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '4'.tr,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
