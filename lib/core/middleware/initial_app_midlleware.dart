import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InitialAppMiddleware extends GetMiddleware {
  static final MyServices sharedPref = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final step = sharedPref.sharedPreferences.getString('step');
    if (step == "2") {
      return RouteSettings(name: AppRoute.homePage);
    }
    if (step == "1") {
      return RouteSettings(name: AppRoute.authScreen);
    }
    return null;
  }
}
