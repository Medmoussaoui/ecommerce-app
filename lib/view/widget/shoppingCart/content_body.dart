import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_handling_data_view.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/circule_loader_items.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/item_card.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ShoppingCartCententBody extends GetView<ShoppringCartController> {
  const ShoppingCartCententBody({Key? key}) : super(key: key);

  Widget _buildItems() {
    return ListView.builder(
      controller: controller.listViewController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: controller.items.length + 1,
      itemBuilder: (context, index) {
        if (index == (controller.items.length)) {
          return const ShoppingCardProgressLoaderItems();
        }
        return Slidable(
          key: Key(controller.items[index].id.toString()),
          endActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () {
                controller.removeItem(index);
              },
            ),
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  controller.addToFavorite(index);
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.favorite_outline,
                label: 'Favorite',
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.red[600]!,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          startActionPane: ActionPane(
            extentRatio: 0.4,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: AppColor.appBarColord,
                foregroundColor: Colors.white,
                icon: Icons.share_rounded,
                label: 'Share',
              ),
            ],
          ),
          child: CustomShoppingCardItem(index: index),
        );
      },
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const ShoppingCartItemShimmer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppringCartController>(
      id: "body",
      builder: (con) {
        return CustomHandlingDataView(
          statusRequest: controller.statusGetItems,
          dataWidget: _buildItems(),
          loadingWidget: _buildShimmer(),
        );
      },
    );
  }
}
