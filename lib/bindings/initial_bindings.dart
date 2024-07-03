import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/controller/page_view_controller.dart';
import 'package:get/get.dart';

class 
InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomPageViewController());
    Get.put(HomePageController());
    Get.put(ShoppringCartController());
  }
}
