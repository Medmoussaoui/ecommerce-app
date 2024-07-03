import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/view/widget/homePage/item_product_card.dart';
import 'package:ecommercecourse/view/widget/homePage/item_product_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomHomeScreenBody extends GetView<HomePageController> {
  const CustomHomeScreenBody({Key? key}) : super(key: key);

  Widget items() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 250,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: controller.items.length,
        (context, index) {
          return CustomItemProductCard(
            item: controller.items[index],
            isFavorate: index == 2, // just for test
            onTap: () {
              controller.redirectToItemDetails(controller.items[index]);
            },
          );
        },
      ),
    );
  }

  Widget itemsShimmerLoading() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 230,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 4,
        (context, index) {
          return const CustomItemProductShimmer();
        },
      ),
    );
  }

  Widget notData() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Get.height / 1.5,
        child: const Center(
          child: Text("No data"),
        ),
      ),
    );
  }

  Widget noInternet() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Get.height / 1.5,
        child: const Center(child: Text("No internet")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      id: "body",
      builder: (con) {
        if (con.itemsStatusRequest.isLoading && con.items.isEmpty) {
          return itemsShimmerLoading();
        }
        if (con.items.isNotEmpty) {
          return items();
        }
        if (con.itemsStatusRequest.isConnectionError) {
          return noInternet();
        }
        return notData();
      },
    );
  }
}
