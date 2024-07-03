import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartAppBar extends GetView<ShoppringCartController> with PreferredSizeWidget {
  const ShoppingCartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[100],
      title: const CustomAuthTitle(
        title: "My Cart",
        color: AppColor.appBarColord,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          splashRadius: 22,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            controller.refreshItems();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
