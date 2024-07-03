import 'package:ecommercecourse/controller/page_view_controller.dart';
import 'package:ecommercecourse/view/screen/PageView/favorite_screen.dart';
import 'package:ecommercecourse/view/screen/PageView/shopping_cart_screen.dart';
import 'package:ecommercecourse/view/widget/customPageView/custom_navigation_battom_bar.dart';
import 'package:ecommercecourse/view/screen/pageView/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomPageViewController>();
    return WillPopScope(
      onWillPop: () async {
        return controller.onPop();
      },
      child: Scaffold(
        bottomNavigationBar: const CustomNavigaationBottomBar(),
        body: PageView(
          controller: controller.pageViewcController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            FavoriteScreen(),
            ShoppingCartScreen(),
          ],
        ),
      ),
    );
  }
}
