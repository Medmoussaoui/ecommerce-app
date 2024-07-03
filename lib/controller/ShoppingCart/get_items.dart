import 'package:ecommercecourse/controller/ShoppingCart/index.dart';

class ShoppingCartGetItems {
  final ShoppringCartController con;

  ShoppingCartGetItems(this.con);

  _setStateStart() {
    con.statusGetItems.loading();
    con.update(["body"]);
  }

  getItems() async {
    _setStateStart();

    con.pageIndex = 0;
    con.items = [];

    await Future.delayed(const Duration(seconds: 2));
    con.statusGetItems = await con.restShoppingCart.getItemsCart(con.pageIndex);

    if (con.statusGetItems.isSuccess) {
      con.itemDecoderAndInsert(con.statusGetItems.data);
    }
    con.update(["body", "cartIcon", "checkOut"]);
  }
}
