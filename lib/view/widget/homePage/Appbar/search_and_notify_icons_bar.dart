import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/shared/custom_icon_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomePageSeachFormAndNorificationIconAppBar extends GetView<HomePageController> {
  const CustomHomePageSeachFormAndNorificationIconAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Logo
        Row(
          children: const [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.blue,
              size: 35,
            ),
            CustomAuthTitle(
              title: "Yalavex",
              color: Colors.white,
            ),
          ],
        ),
        const Spacer(),

        /// Seach Icon
        CustomIconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            Get.toNamed(AppRoute.searchItemsScreen);
          },
        ),
        const SizedBox(width: 7.0),

        /// Notification Icon
        CustomIconButton(
          icon: const Icon(Icons.notifications_none_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
