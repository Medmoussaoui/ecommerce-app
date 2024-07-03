import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/core/shared/custom_shimmer_widget.dart';
import 'package:ecommercecourse/view/widget/homePage/Appbar/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryItemList extends StatelessWidget {
  const CustomCategoryItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      id: "categorys",
      builder: (con) {
        bool noData = !con.categorysStatusRequest.isSuccess;
        return SizedBox(
          height: 38.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: noData ? 4 : con.categorys.length,
            itemBuilder: (context, index) {
              /// no internet return grey container category
              if (noData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: CustomShimmerWidget.rectangle(
                    height: 38.0,
                    width: 70,
                    radius: 5,
                    baseColor: Colors.white38,
                    enable: con.categorysStatusRequest.isLoading,
                  ),
                );
              }

              /// has internet return categorys data
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CustomCategoryItem(
                  category: con.categorys[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
