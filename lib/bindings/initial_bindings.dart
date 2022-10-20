import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiConnect());
  }
}
