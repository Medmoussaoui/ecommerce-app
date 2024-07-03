import 'package:ecommercecourse/controller/auth/sign_in_controller.dart';
import 'package:ecommercecourse/data/source/remote/rest_signin.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestSignIn(), fenix: true);
    Get.put(SignInController());
  }
}
