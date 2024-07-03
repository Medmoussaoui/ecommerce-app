import 'package:ecommercecourse/controller/Favorite/index.dart';

class FavoriteGetItems {
  final FavoriteController con;

  FavoriteGetItems(this.con);

  _setStateStart() {
    con.statusRequest.loading();
    con.update(["body"]);
  }

  getItems() async {
    _setStateStart();

    con.loadingOffset = 0;
    con.items = [];

    await Future.delayed(const Duration(seconds: 2));
    con.statusRequest = await con.restFavorite.getfavoriteItems(index: con.loadingOffset);

    if (con.statusRequest.isSuccess) {
      con.itemDecoderAndInsert(List.from(con.statusRequest.data));
    }
    con.update(["body"]);
  }
}
