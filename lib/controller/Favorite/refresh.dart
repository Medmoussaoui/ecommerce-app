import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/view/widget/favorite/favorite_item_card.dart';
import 'package:flutter/cupertino.dart';

class FavoriteRefreshItems {
  FavoriteController con;

  FavoriteRefreshItems(this.con);

  void _clearAllItems() {
    if (con.items.isEmpty) return;

    int itemIndex = (con.items.length - 1);

    con.animatedListKey.currentState!.removeItem(itemIndex, (ctx, animation) {
      return SizeTransition(
        key: UniqueKey(),
        sizeFactor: animation,
        child: FavoriteItemCard(index: itemIndex),
      );
    });
    con.items.removeLast();
    _clearAllItems();
  }

  _setStateStart() {
    con.statusRequest.loading();
    if (con.items.isEmpty) con.update(["body"]);
    con.update(["refresh"]);
  }

  _setStateEnd() {
    if (con.items.isEmpty) con.update(["body"]);
    con.update(["refresh"]);
  }

  refresh() async {
    _setStateStart();
    await Future.delayed(const Duration(seconds: 2));

    con.statusRequest = await con.restFavorite.getfavoriteItems(index: 0);

    if (con.statusRequest.isSuccess) {
      con.loadingOffset = 0;
      _clearAllItems();
      con.itemDecoderAndInsert(List.from(con.statusRequest.data), loader: true);
      return con.update(["refresh", "body"]);
    }
    _setStateEnd();
  }
}
