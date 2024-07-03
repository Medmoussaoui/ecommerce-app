import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/view/widget/customPageView/custom_shopping_cart_icon.dart';
import 'package:ecommercecourse/view/widget/itemDetails/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CutomItemDetailsAppBar extends GetView<ItemDetailsController> implements PreferredSizeWidget {
  const CutomItemDetailsAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      title: const Text("Product Details"),
      actions: [
        const CustomFavoriteIcon(),
        IconButton(
          splashRadius: 25,
          onPressed: () {
            controller.redirect.toShoppingCart();
          },
          icon: const ShoppingCartIconCount(),
        ),
      ],
    );
  }
}
