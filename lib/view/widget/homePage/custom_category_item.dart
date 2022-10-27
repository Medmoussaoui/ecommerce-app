import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  final bool selected;
  const CustomCategoryItem({Key? key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: selected ? 1.0 : 0.0,
      color: selected ? AppColor.primaryColor : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {},
      child: Text(
        'laptops',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: selected ? Colors.white : null),
      ),
    );
  }
}
