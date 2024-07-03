import 'package:ecommercecourse/controller/search/search_screen_controller.dart';
import 'package:ecommercecourse/core/shared/custom_handling_data_view.dart';
import 'package:ecommercecourse/view/widget/SearchPage/app_bar_search_keywords.dart';
import 'package:ecommercecourse/view/widget/SearchPage/keywords_suggestion_ist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItemsScreen extends StatelessWidget {
  const SearchItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchPageController());
    return Scaffold(
      appBar: const CustomSearchKeywordsScreenAppBar(),
      body: Builder(
        builder: (context) {
          return GetBuilder<SearchPageController>(
            id: "contentBody",
            builder: (con) {
              if (con.searchInput.isEmpty) {
                return Center(child: Text('55'.tr));
              }
              return CustomHandlingDataView(
                statusRequest: con.searchRequest,
                dataWidget: const CustomSearchKeywordsList(),
                noDataWidget: const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }
}
