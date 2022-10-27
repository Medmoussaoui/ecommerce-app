import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/view/widget/homePage/appbar/custom_app_bar.dart';
import 'package:ecommercecourse/view/widget/homePage/custom_item_product_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// App Bar
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomHomePageAppBar(135),
            ),

            /// List Of item Products
            const SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: CustomProductsSliverGridBuilder(),
            )
          ],
        ),
      ),
    );
  }
}
