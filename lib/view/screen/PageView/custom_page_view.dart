import 'package:ecommercecourse/controller/ForgetPassword/page_view_controller.dart';
import 'package:ecommercecourse/view/widget/customPageView/custom_navigation_battom_bar.dart';
import 'package:ecommercecourse/view/screen/pageView/favorite_screen.dart';
import 'package:ecommercecourse/view/screen/pageView/home_screen.dart';
import 'package:ecommercecourse/view/screen/pageView/order_tracking_screen.dart';
import 'package:ecommercecourse/view/screen/pageView/shopping_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomPageViewController());
    return Scaffold(
      bottomNavigationBar: const CustomNavigaationBottomBar(),
      body: PageView(
        controller: controller.pageViewcController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          FavoriateScreen(),
          OrderTrackingScreen(),
          ShoppingCardScreen(),
        ],
      ),
    );
  }
}
