import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/app_bar.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/check_out.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/content_body.dart';
import 'package:ecommercecourse/view/widget/shoppingCart/flloating_refrech_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends GetView<ShoppringCartController> {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  _initialData() async {
    if (controller.items.isEmpty) {
      await controller.getItems();
      return;
    }
    controller.update(["body"]);
  }

  @override
  Widget build(BuildContext context) {
    _initialData();
    return Scaffold(
      floatingActionButton: const ShoppingCartFloatingRefrech(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      bottomNavigationBar: const CustomShoppingCardCheckOut(),
      backgroundColor: Colors.grey[100],
      appBar: const ShoppingCartAppBar(),
      body: const ShoppingCartCententBody(),
    );
  }
}
