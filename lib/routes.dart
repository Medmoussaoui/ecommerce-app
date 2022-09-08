import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/view/screen/auth/login_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoute.login, page: () => const LoginPage()),
  GetPage(name: AppRoute.onBoarding, page: () => const LoginPage()),
];
