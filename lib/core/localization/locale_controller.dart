import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;

  String get langcode => language.languageCode;

  MyServices myServices = Get.find<MyServices>();

  changeLang(String langcode) async {
    await myServices.sharedPreferences.setString('lang', langcode);
    language = Locale(langcode);
    Get.updateLocale(language);
  }

  @override
  void onInit() {
    final String? lang = myServices.sharedPreferences.getString('lang');
    language =
        (lang == null) ? Locale(Get.deviceLocale!.languageCode) : Locale(lang);
    super.onInit();
  }
}
