import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAvgRatingItemDetail extends StatelessWidget {
  const CustomAvgRatingItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.star_rounded, color: Colors.yellow[700]!),
        Text(
          " 5.0",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
        Text(
          "  (Avg rating)",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.grey1.withOpacity(0.7)),
        ),
      ],
    );
  }
}
