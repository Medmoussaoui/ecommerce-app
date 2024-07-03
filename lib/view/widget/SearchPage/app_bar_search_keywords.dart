import 'package:ecommercecourse/controller/search/search_screen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchKeywordsScreenAppBar extends GetView<SearchPageController> implements PreferredSizeWidget {
  const CustomSearchKeywordsScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  Widget clearInputIcon() {
    return GetBuilder<SearchPageController>(
      id: "searchForm",
      builder: (con) {
        return Transform.translate(
          offset: const Offset(0.0, -4),
          child: GestureDetector(
            onTap: controller.clearSearchInput,
            child: Icon(
              Icons.close,
              size: 19.0,
              color: controller.searchInput.isEmpty ? Colors.transparent : AppColor.grey,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColor.grey),
      titleSpacing: 0,
      automaticallyImplyLeading: true,
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: Container(
        height: 40,
        margin: EdgeInsets.only(
          right: Shared.lang == "ar" ? 0.0 : 12,
          left: Shared.lang == "ar" ? 12 : 0.0,
        ),
        padding: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Transform.translate(
          offset: const Offset(0.0, 4),
          child: TextFormField(
            cursorHeight: 25,
            textInputAction: TextInputAction.search,
            controller: controller.formSearchController,
            onChanged: controller.onSearch,
            onFieldSubmitted: controller.selectSuggestionItem,
            autofocus: true,
            decoration: InputDecoration(
              hintText: '54'.tr,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),

              /// clear form input Buttom
              suffixIcon: clearInputIcon(),
            ),
          ),
        ),
      ),
    );
  }
}
