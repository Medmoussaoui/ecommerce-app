import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomTitleAndPriceItemDetail extends GetView<ItemDetailsController> {
  const CustomTitleAndPriceItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAuthTitle(title: controller.itemData.name, fontSize: 21.5),
        const Spacer(),
        CustomAuthTitle(
          title: "\$ ${controller.itemData.price}",
          fontSize: 21.5,
          color: AppColor.secondryColor,
        ),
      ],
    );
  }
}
