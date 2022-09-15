import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/color.dart';
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
      theme: ThemeData(
        fontFamily: localeController.langcode == 'ar' ? 'Noto' : 'Figtree',
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'FredokaOne',
            fontSize: 20.0,
            color: AppColor.blackGrey,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
            color: AppColor.grey,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: AppColor.grey.withOpacity(0.5),
          ),
        ),
        primaryColor: const Color(0xff6c63ff),
      ),
      translations: AppTranslation(),
      locale: localeController.language,
      initialRoute: AppRoute.onBoarding,
      getPages: routes,
    );
  }
}
