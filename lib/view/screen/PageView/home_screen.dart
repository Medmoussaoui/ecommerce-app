import 'package:ecommercecourse/controller/home_page_controller.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/homePage/Appbar/appbar.dart';
import '../../widget/homePage/custom_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _initialData(HomePageController controller) {
    if (!controller.initialDataSuccess) {
      controller.initialHomeData();
      return;
    }

    if (controller.items.isEmpty) {
      controller.getItems();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    _initialData(controller);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            /// Content App Bar
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomHomePageAppBar(125),
            ),

            /// items Griv view
            const SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: CustomHomeScreenBody(),
            ),

            /// Progress Indegater for loading data
            SliverToBoxAdapter(
              child: GetBuilder<HomePageController>(
                id: 'body',
                builder: (con) {
                  if (con.itemsStatusRequest.isLoading && con.items.isNotEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CustomProgressIndicator()),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
