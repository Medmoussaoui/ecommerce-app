import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "تسجيل الدخول",
          "2": "انشاء حساب",
          "3": "اختر لغتك المفضلة",
          "4": "الرجاء اختيار لغتك",
          "ar": "العربية",
          "en": "الانجلزية",
          "fr": "الفرنسية",
          "5": 'تخطي',
          "6": 'استمر'
        },
        "en": {
          "1": "Sign In",
          "2": "Sign Up",
          "3": "Choose Your Preferred Language",
          "4": "Please Select Your Language",
          "ar": "Arabic",
          "en": "English",
          "fr": "Frensh",
          "5": "Skip",
          "6": 'Continue'
        },
      };
}
