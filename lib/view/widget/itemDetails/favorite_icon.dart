import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({Key? key}) : super(key: key);

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemDetailsController>();
    return IconButton(
      splashRadius: 25,
      onPressed: () {
        isFavorite = !isFavorite;
        setState(() {});
        controller.onFavorite(isFavorite);
      },
      icon: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_outlined,
        color: isFavorite ? Colors.red : AppColor.grey,
      ),
    );
  }
}
