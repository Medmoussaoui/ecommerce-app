import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteRemoveButton extends GetView<FavoriteController> {
  final int index;
  const CustomFavoriteRemoveButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 22,
        onPressed: () {
          controller.removeItem(index);
        },
        icon: const Icon(
          Icons.delete,
          color: AppColor.grey,
        ),
      ),
    );
  }
}
