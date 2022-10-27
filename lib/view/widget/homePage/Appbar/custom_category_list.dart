import 'package:ecommercecourse/view/widget/homePage/custom_category_item.dart';
import 'package:flutter/cupertino.dart';

class CustomCategoryItemList extends StatelessWidget {
  const CustomCategoryItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomCategoryItem(
              selected: index == 1,
            ),
          );
        },
      ),
    );
  }
}
