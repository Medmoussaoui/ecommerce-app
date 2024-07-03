import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteItemsList extends GetView<FavoriteController> {
  const FavoriteItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: controller.animatedListKey,
      initialItemCount: controller.items.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: FavoriteItemCard(index: index),
        );
      },
    );
  }
}
