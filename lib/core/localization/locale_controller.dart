import 'package:ecommercecourse/core/constant/app_theme.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;

  String get langcode => language.languageCode;

  MyServices myServices = Get.find<MyServices>();

  late ThemeData appTheme;

  changeLang(String langcode) async {
    await myServices.sharedPreferences.setString('lang', langcode);
    language = Locale(langcode);
    appTheme = langcode == "ar" ? AppTheme.arabicTheme : AppTheme.englishTheme;
    Get.updateLocale(language);
  }

  @override
  void onInit() {
    final String? lang = myServices.sharedPreferences.getString('lang');
    language =
        (lang == null) ? Locale(Get.deviceLocale!.languageCode) : Locale(lang);
    appTheme = (language.languageCode == "ar")
        ? AppTheme.arabicTheme
        : AppTheme.englishTheme;
    super.onInit();
  }
}
