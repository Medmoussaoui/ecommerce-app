import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/itemDetails/add_to_cart.dart';
import 'package:ecommercecourse/view/widget/itemDetails/app_bar.dart';
import 'package:ecommercecourse/view/widget/itemDetails/avg_rating.dart';
import 'package:ecommercecourse/view/widget/itemDetails/itame_title_and_price.dart';
import 'package:ecommercecourse/view/widget/itemDetails/item_picture.dart';
import 'package:ecommercecourse/view/widget/itemDetails/item_select_color_propertie.dart';
import 'package:ecommercecourse/view/widget/itemDetails/item_select_value_propertie.dart';
import 'package:ecommercecourse/view/widget/itemDetails/label_and_quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatefulWidget {
  
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _moveDown;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    )..addListener(() => setState(() {}));

    _moveDown = Tween<double>(begin: -10, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    )..addListener(() => setState(() {}));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemDetailsController());
    return WillPopScope(
      onWillPop: () async {
        return controller.redirect.onPop();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const CutomItemDetailsAppBar(),
        body: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CustomItemPictureDetail(),
                ),
                Transform.translate(
                  offset: Offset(0.0, _moveDown.value),
                  child: Opacity(
                    opacity: _opacity.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomLabelAndQuantityCounterItemDetail(),
                          const SizedBox(height: 25.0),
                          const CustomTitleAndPriceItemDetail(),
                          const SizedBox(height: 7.0),
                          const CustomAvgRatingItemDetail(),
                          const SizedBox(height: 7.0),
                          CustomSubTitle(
                            subtitle: "${controller.itemData.desc}...",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.blackGrey, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 25.0),
                          const CustomAuthTitle(
                            title: "Select SSD",
                            fontSize: 16.5,
                          ),
                          const SizedBox(height: 15.0),
                          StatefulBuilder(
                            builder: (ctx, setState) {
                              return SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.ssd.length,
                                  itemBuilder: (context, i) {
                                    return CustomSelectValuePropertieItemDetail(
                                      value: controller.ssd[i],
                                      isSelect: controller.selectValueIndex == i,
                                      onTap: () {
                                        setState(() => controller.selectValueIndex = i);
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          //
                          const SizedBox(height: 20.0),
                          const CustomAuthTitle(
                            title: "Select Color",
                            fontSize: 16.5,
                          ),
                          const SizedBox(height: 15.0),
                          StatefulBuilder(builder: (ctx, setState) {
                            return SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.laptopColors.length,
                                itemBuilder: (context, i) {
                                  return CustomSelectColorPropertieItemDetail(
                                    color: controller.laptopColors[i],
                                    isSelect: controller.selectColorIndex == i,
                                    onTap: () {
                                      setState(() => controller.selectColorIndex = i);
                                    },
                                  );
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100)
              ],
            ),

            /// ADD to card button
            const Align(
              alignment: Alignment.bottomCenter,
              child: AddToCartItemDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
