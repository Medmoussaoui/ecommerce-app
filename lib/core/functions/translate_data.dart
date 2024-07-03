import 'package:ecommercecourse/core/services/services.dart';
import 'package:get/get.dart';

/// Ar is take the arabic text
/// En is take the english text
translateData(String ar, String en) {
  MyServices services = Get.find<MyServices>();
  if (services.sharedPreferences.getString("lang") == "ar") {
    return ar;
  }
  return en;
}
