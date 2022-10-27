import 'package:ecommercecourse/controller/page_view_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigaationBottomBar extends GetView<CustomPageViewController> {
  const CustomNavigaationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CustomPageViewController>(builder: (con) {
      return SalomonBottomBar(
        currentIndex: controller.currentPage.value,
        onTap: (index) => con.onPageChange(index),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: AppColor.primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Favorite"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart_rounded),
            title: const Text("Shopping Card"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.track_changes_rounded),
            title: const Text("Tracking"),
            selectedColor: Colors.teal,
          ),
        ],
      );
    });
  }
}
