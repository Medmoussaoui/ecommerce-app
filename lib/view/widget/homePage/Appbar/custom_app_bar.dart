import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/homePage/appbar/custom_category_list.dart';
import 'package:ecommercecourse/view/widget/homePage/appbar/custom_search_and_icon_bar.dart';
import 'package:flutter/material.dart';

class CustomHomePageAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  CustomHomePageAppBar(this.expandedHeight);

  Widget showSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CustomHomePageSeachFormAndNorificationIconAppBar(),
          SizedBox(height: 15),
          CustomCategoryItemList(),
        ],
      ),
    );
  }

  Widget showAppBarWithTitle() {
    return AppBar(
      title: const CustomAuthTitle(
        title: 'Products',
        fontSize: 18.0,
      ),
      centerTitle: true,
      elevation: 2.5,
      backgroundColor: Colors.grey[100],
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
        child: (shrinkOffset < expandedHeight / 2)
            ? showSearchBar()
            : showAppBarWithTitle(),
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
