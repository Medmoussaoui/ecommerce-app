import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangTitle extends StatelessWidget {
  const CustomLangTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('3'.tr, style: Theme.of(context).textTheme.headlineLarge);
  }
}
