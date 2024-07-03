import 'package:ecommercecourse/controller/search/display_items_search_controller.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/view/widget/SearchPage/app_bar_display_prodcuts.dart';
import 'package:ecommercecourse/view/widget/SearchPage/items_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayItemsSearchScreen extends StatelessWidget {
  const DisplayItemsSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DisplayItemsSearchScreenController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomDisplayProductsSearchAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            /// Items
            const CustomDisplayItemsSearchList(),

            /// Circuler Progress Indecater for loading items
            GetBuilder<DisplayItemsSearchScreenController>(
              builder: (con) {
                if (con.itemsStatusRequest.isLoading && con.items.isNotEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CustomProgressIndicator()),
                  );
                }
                return const SizedBox(
                  height: 18,
                  width: 18,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
