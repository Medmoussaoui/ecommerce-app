import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/homePage/Appbar/category_list.dart';
import 'package:ecommercecourse/view/widget/homePage/Appbar/search_and_notify_icons_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomePageAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  CustomHomePageAppBar(this.expandedHeight);

  Widget showSearchBar() {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: CustomHomePageSeachFormAndNorificationIconAppBar(),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: CustomCategoryItemList(),
          ),
        ],
      ),
    );
  }

  Widget showAppBarWithTitle() {
    return AppBar(
      title: CustomAuthTitle(
        title: '53'.tr,
        fontSize: 19,
        color: Colors.white,
      ),
      centerTitle: true,
      elevation: 2.5,
      backgroundColor: AppColor.appBarColord,
    );
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.appBarColord,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 2.5,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.linear,
        child: (shrinkOffset < expandedHeight / 2) ? showSearchBar() : showAppBarWithTitle(),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
