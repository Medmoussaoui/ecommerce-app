import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemDetailAddToCartButton extends StatelessWidget {
  const CustomItemDetailAddToCartButton({Key? key}) : super(key: key);

  Widget _addToCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Add to cart'),
        SizedBox(width: 10),
        Icon(Icons.shopping_cart_outlined),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsController>(
      id: "addToCart",
      builder: (con) {
        return CustomPrimaryButton(
          color: con.addToCartStatusRequest.isLoading ? AppColor.primaryColor.withOpacity(0.8) : null,
          bottomPadding: 0.0,
          onPressed: () {
            con.addToCart();
          },
          child: Builder(
            builder: (_) {
              if (con.addToCartStatusRequest.isLoading) {
                return const CustomProgressIndicator(color: Colors.white);
              }
              return _addToCart();
            },
          ),
        );
      },
    );
  }
}
