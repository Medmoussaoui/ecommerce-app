import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/stars_rating.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/favorite/remove_item_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItemCard extends GetView<FavoriteController> {
  final int index;
  const FavoriteItemCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.redirectToItemDetails(index);
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: Colors.grey[350]!,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            /// Item Picture
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!, width: 0.5),
              ),
              child: Hero(
                tag: "FavorateScreen ${controller.items[index].itemId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLinksApi.imagePath}/${controller.items[index].image}",
                ),
              ),
            ),

            /// Title And Price And Rating
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAuthTitle(title: controller.items[index].name, fontSize: 14.5),
                  const SizedBox(height: 3.0),
                  Text(
                    "\$ ${controller.items[index].price}.0",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.blackGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                  ),
                  const CustomStarsRating(rating: 4)
                ],
              ),
            ),
            const Spacer(),
            CustomFavoriteRemoveButton(index: index),
          ],
        ),
      ),
    );
  }
}
