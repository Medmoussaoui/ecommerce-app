import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }
}
