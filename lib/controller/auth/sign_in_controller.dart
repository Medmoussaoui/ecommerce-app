import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/custom_attention_bottom_sheet.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/source/remote/rest_signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailAddess;
  late TextEditingController password;
  late GlobalKey<FormState> formState;

  StatusRequest statusRequest = StatusRequest();
  MyServices myServices = Get.find();
  RestSignIn restSignIn = RestSignIn();

  signIn() async {
    if (statusRequest.isLoading) return;

    if (formState.currentState!.validate() == false) {
      formState.currentState!.save(); // to make form Faild auto validate
      return;
    }

    statusRequest.loading();
    update();
    statusRequest = await restSignIn.signIn(
      emailAddess.text,
      password.text,
    );

    if (statusRequest.isSuccess) {
      dynamic cookie = statusRequest.headers!["set-cookie"];
      await myServices.sharedPreferences.setString("cookie", cookie);
      await myServices.sharedPreferences.setString("step", '2');
      Shared.cookie = cookie;
      return Get.offNamed(AppRoute.customPageView);
    }

    if (statusRequest.isRespondError) {
      customAttentionDialogSheet(
        title: "فشل تسجيل الدخول",
        subTitle: "اسم المستخدم أو كلمة المرور الخاصة بك غير صالحة",
        icon: const Icon(null, color: Colors.red),
      );
    }
    update();
  }

  redirectToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  redirectToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    emailAddess = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailAddess.dispose();
    password.dispose();
    super.dispose();
  }
}
