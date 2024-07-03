import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteRemoveItem {
  final con = Get.find<FavoriteController>();

  undowRemovedItem(int index) {
    con.animatedListKey.currentState!.insertItem(index);
  }

  askForTryRemoveItem(int index) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("Item dosn't removed !!"),
      action: SnackBarAction(
        label: 'Try again',
        onPressed: () {
          removeItem(index);
        },
      ),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  Future<bool> askForUndowRemovedItem(int index) async {
    bool undow = false;
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text('1 Item Deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          undowRemovedItem(index);
          undow = true;
        },
      ),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    await Future.delayed(const Duration(seconds: 2));
    return undow;
  }

  removeItemFromAnimatedList(int index) {
    con.animatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        key: UniqueKey(),
        sizeFactor: animation,
        child: FavoriteItemCard(index: index),
      );
    });
  }

  refrechBodyIfHasNoItems() {
    if (con.items.isEmpty) {
      con.statusRequest.data = [];
      con.update(["body"]);
    }
  }

  /// Main Methode
  removeItem(int index) async {
    removeItemFromAnimatedList(index);

    final bool undow = await askForUndowRemovedItem(index);
    if (undow) return;

    StatusRequest restRemoveItem = await con.restFavorite.removeItem(con.items[index].itemId.toString());
    if (restRemoveItem.isSuccess) {
      con.items.removeAt(index);
      return refrechBodyIfHasNoItems();
    }
    // UnSuccessfull Remove Item
    undowRemovedItem(index);
    askForTryRemoveItem(index);
  }
}
