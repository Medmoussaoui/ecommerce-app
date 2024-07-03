import 'package:ecommercecourse/controller/checkOut/Success/animation.dart';
import 'package:get/get.dart';

class SuccessOrderScreenController extends GetxController {
  late SuccsesOrderAnimation animation;

  @override
  void onInit() {
    animation = SuccsesOrderAnimation();
    super.onInit();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }
}
