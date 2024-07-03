import 'package:ecommercecourse/controller/search/display_items_search_controller.dart';
import 'package:ecommercecourse/controller/search/search_screen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDisplayProductsSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomDisplayProductsSearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  final controller = Get.find<DisplayItemsSearchScreenController>();

  Widget fillterIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: CustomIconButton(
        borderRadius: 15,
        icon: const Icon(Icons.filter_list),
        onPressed: () {
          // logic fillter here inxaa lah
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String searchInput = Get.find<SearchPageController>().searchInput;
    return AppBar(
      iconTheme: const IconThemeData(color: AppColor.grey),
      titleSpacing: 0,
      automaticallyImplyLeading: true,
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: Container(
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Transform.translate(
          offset: const Offset(0.0, 4),
          child: TextFormField(
            onTap: () {
              Get.back();
            },
            initialValue: searchInput,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Find our products',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      actions: [
        fillterIcon(),
      ],
    );
  }
}
