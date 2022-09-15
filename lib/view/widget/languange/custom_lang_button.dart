import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangButton extends GetView<LocaleController> {
  final String langecode;
  final String langIcon;

  const CustomLangButton(
      {Key? key, required this.langIcon, required this.langecode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: langecode != "fr"
            ? Border(bottom: BorderSide(color: Colors.grey[300]!, width: 0.8))
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(
          langecode.tr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.8,
            color: AppColor.blackGrey,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 19.0,
          child: Image.asset(
            langIcon,
            height: 25.0,
          ),
        ),
        trailing: Icon(
          controller.langcode == langecode ? Icons.check_rounded : null,
          color: AppColor.primaryColor,
        ),
        onTap: () {
          controller.changeLang(langecode);
        },
      ),
    );
  }
}
