import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:ecommercecourse/data/source/remote/rest_search_keywords.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  late TextEditingController formSearchController;

  String get searchInput => formSearchController.text;

  StatusRequest searchRequest = StatusRequest();
  StatusRequest productsRequest = StatusRequest();
  RestSearch restSearch = RestSearch();

  List<ItemModule> productItems = [];

  onSearch(String input) async {
    if (input.isNotEmpty) {
      searchRequest.loading();
      update(["contentBody", "searchForm"]);
      searchRequest = await restSearch.searchKeywords(input);
      await Future.delayed(const Duration(seconds: 1));
      update(["contentBody"]);
      return;
    }
    update(["searchForm", "contentBody"]);
  }

  clearSearchInput() {
    formSearchController.clear();
    update(["searchForm", "contentBody"]);
  }

  selectSuggestionItem(String suggestion) {
    if (searchInput.isEmpty) return;
    formSearchController.text = suggestion;
    Get.toNamed(AppRoute.displayItemsSearchScreen, arguments: {"searchInput": searchInput});
  }

  @override
  void onInit() {
    formSearchController = TextEditingController();
    super.onInit();
  }
}
