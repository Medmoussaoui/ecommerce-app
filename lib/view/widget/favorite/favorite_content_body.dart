import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/shared/custom_handling_data_view.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_items_list.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_items_shimmer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteContentBody extends GetView<FavoriteController> {
  const FavoriteContentBody({Key? key}) : super(key: key);

  _statusRequest() {
    if (controller.isLoadingItemsInScrolling) return StatusRequest().loading();
    controller.statusRequest.data = controller.items;
    return controller.statusRequest;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      id: "body",
      builder: (controller) {
        return CustomHandlingDataView(
          statusRequest: _statusRequest(),
          dataWidget: const FavoriteItemsList(),
          loadingWidget: const FavoriteItemsShimmerList(),
        );
      },
    );
  }
}
