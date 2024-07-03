import 'package:ecommercecourse/controller/search/search_screen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/module/suggestion_search_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchKeywordsList extends GetView<SearchPageController> {
  const CustomSearchKeywordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.searchRequest.data.length,
      itemBuilder: (context, index) {
        return CustomSearchPageKeywordsSuggection(
          suggestion: controller.searchRequest.data[index],
        );
      },
    );
  }
}

class CustomSearchPageKeywordsSuggection extends GetView<SearchPageController> {
  final SuggestionSearchItem suggestion;
  const CustomSearchPageKeywordsSuggection({
    Key? key,
    required this.suggestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectSuggestionItem(suggestion.itemName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]!, width: 0.5),
        ),
        child: Row(
          children: [
            Text(
              suggestion.itemName,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColor.blackGrey,
                  ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward,
              color: AppColor.grey,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
