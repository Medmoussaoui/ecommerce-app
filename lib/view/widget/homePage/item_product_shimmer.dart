import 'package:ecommercecourse/core/shared/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomItemProductShimmer extends StatelessWidget {
  const CustomItemProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 1.5,
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: CustomShimmerWidget.rectangle(
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 7.0),
                const CustomShimmerWidget.rectangle(width: 100, height: 15),
                const SizedBox(height: 7.0),
                const CustomShimmerWidget.rectangle(width: 70, height: 12),
                const SizedBox(height: 10.0),
                const Spacer(),
                Row(
                  children: const [
                    CustomShimmerWidget.rectangle(width: 50, height: 20),
                    Spacer(),
                    CustomShimmerWidget.circule(width: 30, height: 30),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
