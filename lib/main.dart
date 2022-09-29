import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/localization/app_translation.dart';
import 'package:ecommercecourse/core/localization/locale_controller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: localeController.appTheme,
      translations: AppTranslation(),
      locale: localeController.language,
      initialRoute: AppRoute.language,
      getPages: routes,
    );
  }
}
