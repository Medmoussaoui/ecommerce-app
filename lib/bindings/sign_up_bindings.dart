import 'package:ecommercecourse/controller/auth/sign_up_controller.dart';
import 'package:ecommercecourse/data/source/remote/rest_sign_up.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestSignUp(), fenix: true);
    Get.put(SignUpController());
  }
}
