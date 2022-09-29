import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/view/screen/auth/auth_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forget_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forget_password_verify_code_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/sign_up.dart';
import 'package:ecommercecourse/view/screen/auth/sign_in.dart';
import 'package:ecommercecourse/view/screen/auth/verify_code_signup_screen.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/language_screen.dart';
import 'package:ecommercecourse/view/screen/onboarding_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoute.signIn, page: () => const SignInScreen()),
  GetPage(name: AppRoute.onBoarding, page: () => OnBoardingScreen()),
  GetPage(name: AppRoute.language, page: () => const LanguageScreen()),
  GetPage(name: AppRoute.authScreen, page: () => const AuthScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(
      name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(
      name: AppRoute.forgetPasswordVerifyCode,
      page: () => const ForgetPasswordVerifyCodeScreen()),
  GetPage(
      name: AppRoute.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(
      name: AppRoute.successSignUp, page: () => const SuccessSignUpScreen()),
  GetPage(
      name: AppRoute.signupVerifyEmail,
      page: () => const SignUpVerifyCodeScreen()),
];
