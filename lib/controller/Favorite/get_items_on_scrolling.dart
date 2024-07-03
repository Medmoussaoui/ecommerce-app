import 'package:ecommercecourse/controller/Favorite/index.dart';

class FavoriteGetItemsOnScrolling {
  final FavoriteController controller;

  FavoriteGetItemsOnScrolling(this.controller);

  _getItemsOnScolling() async {
    controller.statusRequest.loading();
    controller.update(["loader"]);
    await Future.delayed(const Duration(seconds: 2));
    controller.loadingOffset++;

    controller.statusRequest = await controller.restFavorite.getfavoriteItems(
      index: controller.loadingOffset,
    );

    controller.update(["loader"]);

    if (controller.statusRequest.isSuccess) {
      controller.itemDecoderAndInsert(List.of(controller.statusRequest.data), loader: true);
      controller.update(["body"]);
    }
  }

  onScrolling() async {
    double rangeStartLoadingData = controller.scrollController.position.maxScrollExtent - 30;
    if (controller.scrollController.position.pixels <= rangeStartLoadingData) return;
    if (controller.statusRequest.isLoading) return;
    _getItemsOnScolling();
  }
}
