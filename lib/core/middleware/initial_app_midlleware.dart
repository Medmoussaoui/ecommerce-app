import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InitialAppMiddleware extends GetMiddleware {
  static final MyServices sharedPref = Get.find();

  static neverShowOnBoardingAgain() {
    sharedPref.sharedPreferences.setBool("initApp", true);
  }

  @override
  RouteSettings? redirect(String? route) {
    final initApp = sharedPref.sharedPreferences.get('initApp');
    return initApp == null ? null : RouteSettings(name: AppRoute.authScreen);
  }
}
