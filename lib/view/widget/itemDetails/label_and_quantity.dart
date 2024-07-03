import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/counter_countity.dart';
import 'package:ecommercecourse/data/module/shopping_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabelAndQuantityCounterItemDetail extends GetView<ItemDetailsController> {
  const CustomLabelAndQuantityCounterItemDetail({Key? key}) : super(key: key);

  int _quantityInitialValue() {
    bool isFromShoppingCart = controller.checkIfComesFromShoppingCart();
    if (isFromShoppingCart) return (controller.itemData as ShoppingCartItem).quantity;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 29,
          width: 110,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.therdyColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Text(
            "Free shipping",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.blackGrey, fontSize: 13.0),
          ),
        ),
        const Spacer(),
        CounterQuantityWidget(
          initialValue: _quantityInitialValue(),
          onChange: controller.setQauntity,
        ),
      ],
    );
  }
}
