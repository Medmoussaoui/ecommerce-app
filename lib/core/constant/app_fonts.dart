import 'package:ecommercecourse/core/localization/locale_controller.dart';
import 'package:get/get.dart';

class AppFonts {
  static LocaleController localeController = Get.find();

  static String get appLang => localeController.language.languageCode;

  static String fontStyle1 = (appLang == "ar") ? 'Cairo' : '';

  static String fontStyle2 = (appLang == "ar") ? 'Cairo' : 'Figtree';
}
