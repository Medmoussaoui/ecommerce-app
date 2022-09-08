import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/routes.dart';
import 'package:ecommercecourse/view/screen/auth/login_page.dart';
import 'package:ecommercecourse/view/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
        ),
        primaryColor: const Color(0xff6c63ff),
      ),
      home: OnBoardingScreen(),
      getPages: routes,
    );
  }
}
