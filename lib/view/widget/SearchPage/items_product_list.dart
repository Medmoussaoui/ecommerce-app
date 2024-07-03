import 'package:ecommercecourse/controller/search/display_items_search_controller.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/view/widget/homePage/item_product_card.dart';
import 'package:ecommercecourse/view/widget/homePage/item_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDisplayItemsSearchList extends GetView<DisplayItemsSearchScreenController> {
  const CustomDisplayItemsSearchList({Key? key}) : super(key: key);

  EdgeInsetsGeometry _setPaddingBetweenAppBarAndProducts(int index) {
    // this to check if the index is 0 or 1
    // that means if it is we will add padding to the top
    // to set space bettwin app bar and products
    if (index == 0 || index == 1) return const EdgeInsets.only(top: 10);
    return EdgeInsets.zero;
  }

  Widget loadings() {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 230,
        ),
        itemBuilder: (context, index) {
          return const CustomItemProductShimmer();
        },
      ),
    );
  }

  Widget products(List<ItemModule> data) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 240,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: _setPaddingBetweenAppBarAndProducts(index),
          child: CustomItemProductCard(
            onTap: () {
              controller.redirect.toItemDetails(data[index]);
            },
            item: data[index],
            isFavorate: index == 2, // for test
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisplayItemsSearchScreenController>(
      builder: (con) {
        if (con.itemsStatusRequest.isLoading && con.items.isEmpty) {
          return loadings();
        }
        if (con.itemsStatusRequest.isConnectionError) {
          return const Text('No Internet '); // for test now
        }
        if (con.items.isNotEmpty) {
          return products(con.items);
        }
        return const Text('No Data'); // for test now
      },
    );
  }
}
