import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/view/widget/homePage/custom_item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomProductsSliverGridBuilder extends GetView<HomePageController> {
  const CustomProductsSliverGridBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 220,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return CustomItemProductCard(
            isFavorate: index == 2,
          );
        },
      ),
    );
  }
}
