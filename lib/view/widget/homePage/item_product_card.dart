import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/translate_data.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';

class CustomItemProductCard extends StatelessWidget {
  final bool isFavorate;
  final ItemModule item;
  final void Function()? onTap;

  const CustomItemProductCard({
    Key? key,
    required this.item,
    this.isFavorate = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 1.5,
              color: Colors.grey.withOpacity(0.1),
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                /// Prouct Picture
                Expanded(
                  child: Hero(
                    tag: "homeScreen ${item.itemId}",
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider("${AppLinksApi.imagePath}/${item.image}"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Title and description
                const SizedBox(height: 7.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAuthTitle(
                        title: translateData(item.nameAr, item.name),
                        fontSize: Shared.lang == "ar" ? 13.0 : 15,
                      ),
                      const SizedBox(height: 3.0),
                      CustomSubTitle(
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal),
                        subtitle: "حاسوب بمواصفات رفيغة وسعر معقول للجميع...",
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),

                      /// Price And Arrow Button
                      Row(
                        children: [
                          Text(
                            "\$${item.price}",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: AppColor.blackGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.5,
                                ),
                          ),
                          const Spacer(),
                          ClipOval(
                            child: Material(
                              color: AppColor.primaryColor,
                              child: InkWell(
                                splashColor: Colors.grey[200],
                                onTap: () {},
                                child: const SizedBox(
                                  width: 34,
                                  height: 34,
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 16.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Favorate Icon
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite_rounded,
                color: isFavorate ? Colors.red : Colors.grey[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
