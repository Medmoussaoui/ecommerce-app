import 'package:ecommercecourse/core/shared/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShoppingCartItemShimmer extends StatelessWidget {
  const ShoppingCartItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          const CustomShimmerWidget.rectangle(height: 80, width: 80),

          /// Title And Price And Rating
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomShimmerWidget.rectangle(height: 15, width: 100),
                SizedBox(height: 3.0),
                CustomShimmerWidget.rectangle(height: 15, width: 50),
                CustomShimmerWidget.rectangle(height: 12, width: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
