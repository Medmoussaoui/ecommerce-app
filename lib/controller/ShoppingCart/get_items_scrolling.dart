import 'package:ecommercecourse/controller/ShoppingCart/index.dart';

class ShoppingCartGetItemsOnScrolling {
  final ShoppringCartController con;
  ShoppingCartGetItemsOnScrolling(this.con);

  _get() async {
    con.statusLoadingItems.loading();
    con.update(["loader"]);
    await Future.delayed(const Duration(seconds: 2));

    con.pageIndex++;
    con.statusLoadingItems = await con.restShoppingCart.getItemsCart(con.pageIndex);

    if (con.statusLoadingItems.isSuccess) {
      con.itemDecoderAndInsert(con.statusLoadingItems.data);
      con.update(["body", "cartIcon"]);
    }
    con.update(["loader"]);
  }

  getItemsOnScrolling() async {
    double rangeStartLoadingData = con.listViewController.position.maxScrollExtent - 30;
    if (con.listViewController.position.pixels <= rangeStartLoadingData) return;
    if (con.statusLoadingItems.isLoading) return;
    _get();
  }
}
