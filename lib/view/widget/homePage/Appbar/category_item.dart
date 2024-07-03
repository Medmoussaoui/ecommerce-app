import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translate_data.dart';
import 'package:ecommercecourse/data/module/category_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryItem extends GetView<HomePageController> {
  final CategoryModule category;

  const CustomCategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelect = controller.selectedCategory == category.id;
    return InkWell(
      onTap: () => controller.onSelectCategory(category.id),
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: isSelect ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(5.0),
          //border: isSelect ? null : Border.all(color: Colors.white54, width: 0.4),
        ),
        child: Center(
          child: Text(
            translateData(category.nameAr, category.name),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: isSelect ? Colors.white : Colors.white60),
          ),
        ),
      ),
    );
  }
}
