import 'package:ecommercecourse/controller/ShoppingCart/index.dart';

class ShoppingCartRefreshItems {
  ShoppringCartController con;

  ShoppingCartRefreshItems(this.con);

  _setStateStart() {
    con.statusGetItems.loading();
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
    con.statusGetItems = await con.restShoppingCart.getItemsCart(0);

    if (con.statusGetItems.isSuccess) {
      con.pageIndex = 0;
      con.items = [];
      con.itemDecoderAndInsert(con.statusGetItems.data);
      return con.update(["body", "refresh", "cartIcon"]);
    }

    _setStateEnd();
  }
}
