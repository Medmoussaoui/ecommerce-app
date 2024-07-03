import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemPictureDetail extends GetView<ItemDetailsController> {
  const CustomItemPictureDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColor.blackGrey, width: 0.2),
        ),
      ),
      child: Hero(
        tag: controller.picutreHeroId,
        child: CachedNetworkImage(
          imageUrl: "${AppLinksApi.imagePath}/${controller.item.last.image}",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
