import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSkipButton extends GetView<LocaleController> {
  const CustomSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      child: Align(
        alignment: controller.language.languageCode == "ar"
            ? Alignment.topLeft
            : Alignment.topRight,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.onBoarding);
          },
          child:
              Text('5'.tr, style: Theme.of(context).textTheme.headlineSmall!),
        ),
      ),
    );
  }
}
