import 'package:ecommercecourse/controller/page_view_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigaationBottomBar extends GetView<CustomPageViewController> {
  const CustomNavigaationBottomBar({Key? key}) : super(key: key);

  TextStyle customTextStyle(BuildContext context, {Color? color}) {
    color = color ?? Colors.white;
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: color,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CustomPageViewController>(builder: (con) {
      return Container(
        color: AppColor.appBarColord,
        child: SalomonBottomBar(
          currentIndex: controller.currentPage.value,
          onTap: (index) => con.onPageChange(index),
          items: List.generate(
            controller.navigationBottomItems.length,
            (index) => SalomonBottomBarItem(
              icon: con.navigationBottomItems[index].icon,
              title: Text(
                con.navigationBottomItems[index].title,
                style: customTextStyle(context),
              ),
              unselectedColor: Colors.white38,
              selectedColor: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
