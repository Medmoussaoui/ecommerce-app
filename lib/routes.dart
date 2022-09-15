import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/view/screen/auth/auth_screen.dart';
import 'package:ecommercecourse/view/screen/auth/login_screen.dart';
import 'package:ecommercecourse/view/screen/language_screen.dart';
import 'package:ecommercecourse/view/screen/onboarding_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.onBoarding, page: () => OnBoardingScreen()),
  GetPage(name: AppRoute.language, page: () => const LanguageScreen()),
  GetPage(name: AppRoute.authScreen, page: () => const AuthScreen()),
];
