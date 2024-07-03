import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_content_body.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_progress_loader.dart';
import 'package:ecommercecourse/view/widget/favorite/refresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  _initialData(FavoriteController controller) {
    if (!controller.buildScreen) {
      controller.getItems();
      controller.buildScreen = true;
      return;
    }
    if (controller.items.isEmpty) {
      controller.getItems();
      return;
    }
    controller.update(["body"]);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    _initialData(controller);
    return Scaffold(
      floatingActionButton: const FavoriteFloatingRefrech(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
        title: const CustomAuthTitle(title: "Favorite", color: AppColor.appBarColord),
        actions: [
          IconButton(
            splashRadius: 22,
            icon: const Icon(Icons.refresh, color: AppColor.appBarColord),
            onPressed: () {
              controller.refreshItems();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          children: const [
            FavoriteContentBody(),
            FavoriteCirculerProgressLoader(),
          ],
        ),
      ),
    );
  }
}
