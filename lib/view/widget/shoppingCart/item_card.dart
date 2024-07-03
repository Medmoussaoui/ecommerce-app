import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/stars_rating.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/countity_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShoppingCardItem extends GetView<ShoppringCartController> {
  final int index;
  const CustomShoppingCardItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartItem item = controller.items[index];

    return GestureDetector(
      onTap: () {
        controller.redirect.toItemDetails(item);
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 1.0, right: 10, left: 10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1.5,
            ),
          ],
        ),
        child: Row(
          children: [
            /// Item Picture
            Hero(
              tag: "shopping ${item.id}",
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!, width: 0.5),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${AppLinksApi.imagePath}/${item.image}",
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
                  CustomAuthTitle(title: item.name, fontSize: 14.5),
                  const SizedBox(height: 3.0),
                  Text(
                    "\$ ${item.price}",
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
            ShoppingCartCounterQuantity(
              initialValue: item.quantity,
              onChange: (value) {
                controller.updateQuantity(index, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
