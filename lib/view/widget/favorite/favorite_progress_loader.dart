import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteCirculerProgressLoader extends GetView<FavoriteController> {
  const FavoriteCirculerProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      id: "loader",
      builder: (con) {
        if (controller.isLoadingItemsInScrolling) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CustomProgressIndicator(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
