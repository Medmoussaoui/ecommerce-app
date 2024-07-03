import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';

class ShoppingCartCounterQuantity extends StatelessWidget {
  final void Function(int value) onChange;
  final int max;
  final int min;
  int initialValue;

  ShoppingCartCounterQuantity({
    Key? key,
    required this.initialValue,
    required this.onChange,
    this.max = -1,
    this.min = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (ctx, setState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (max != -1 && (initialValue + 1) > max) return;
              initialValue++;
              setState(() {});
              onChange(initialValue);
            },
            child: Container(
              height: 25,
              width: 28,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomAuthTitle(
              title: "$initialValue",
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (initialValue - 1 < min) return;
              initialValue--;
              setState(() {});
              onChange(initialValue);
            },
            child: Container(
              height: 25,
              width: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: AppColor.grey1),
              ),
              child: const Icon(
                Icons.remove_rounded,
                color: AppColor.grey1,
                size: 16,
              ),
            ),
          ),
        ],
      );
    });
  }
}
