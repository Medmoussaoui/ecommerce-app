import 'package:ecommercecourse/bindings/forget_password_bindings.dart';
import 'package:ecommercecourse/bindings/sign_in_bindings.dart';
import 'package:ecommercecourse/bindings/sign_up_bindings.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/middleware/initial_app_midlleware.dart';
import 'package:ecommercecourse/test_screen.dart';
import 'package:ecommercecourse/view/screen/PageView/favorite_screen.dart';
import 'package:ecommercecourse/view/screen/PageView/shopping_cart_screen.dart';
import 'package:ecommercecourse/view/screen/auth/SignIn/forgetpassword/forget_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/SignIn/forgetpassword/forget_password_verify_code_screen.dart';
import 'package:ecommercecourse/view/screen/auth/SignIn/forgetpassword/reset_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/SignIn/forgetpassword/success_reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/auth_screen.dart';
import 'package:ecommercecourse/view/screen/auth/signUp/signup_screen.dart';
import 'package:ecommercecourse/view/screen/auth/SignIn/sign_in.dart';
import 'package:ecommercecourse/view/screen/auth/signUp/verify_code_screen.dart';
import 'package:ecommercecourse/view/screen/auth/signUp/signup_success_screen.dart';
import 'package:ecommercecourse/view/screen/checkOut/check_out_view.dart';
import 'package:ecommercecourse/view/screen/item_details_screen.dart';
import 'package:ecommercecourse/view/screen/pageView/custom_page_view.dart';
import 'package:ecommercecourse/view/screen/pageView/home_screen.dart';
import 'package:ecommercecourse/view/screen/language_screen.dart';
import 'package:ecommercecourse/view/screen/onboarding_screen.dart';
import 'package:ecommercecourse/view/screen/searchPage/display_items_search_screen.dart';
import 'package:ecommercecourse/view/screen/searchPage/seach_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: AppRoute.signIn,
    binding: SignInBinding(),
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoute.language,
    page: () => const LanguageScreen(),
    middlewares: [InitialAppMiddleware()],
  ),
  GetPage(
    name: AppRoute.authScreen,
    page: () => const AuthScreen(),
  ),
  GetPage(
    name: AppRoute.signUp,
    binding: SignUpBinding(),
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    binding: ForgetPasswordBindings(),
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.forgetPasswordVerifyCode,
    page: () => const ForgetPasswordVerifyCodeScreen(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.successSignUp,
    page: () => const SuccessSignUpScreen(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignUp,
    page: () => const SignUpVerifyCodeScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: AppRoute.testScreen,
    page: () => const TestScreen(),
  ),
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.customPageView,
    page: () => const CustomPageView(),
  ),
  GetPage(
    name: AppRoute.favoriteScreen,
    page: () => const FavoriteScreen(),
  ),
  GetPage(
    name: AppRoute.searchItemsScreen,
    page: () => const SearchItemsScreen(),
  ),
  GetPage(
    name: AppRoute.displayItemsSearchScreen,
    transition: Transition.rightToLeft,
    page: () => const DisplayItemsSearchScreen(),
  ),
  GetPage(
    name: AppRoute.itemDetailsScreen,
    transition: Transition.rightToLeft,
    page: () => const ItemDetailsScreen(),
  ),
  GetPage(
    name: AppRoute.shoppingCart,
    transition: Transition.rightToLeft,
    page: () => const ShoppingCartScreen(),
  ),
  GetPage(
    name: AppRoute.checkOutScreen,
    transition: Transition.rightToLeft,
    page: () => const CheckOutScreen(),
  ),
];
