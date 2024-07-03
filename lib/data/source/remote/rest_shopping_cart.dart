import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:get/get.dart';

class RestShoppingCart extends GetConnect {
  Future<StatusRequest> getItemsCart(int page) async {
    final res = await get(
      "${AppLinksApi.shoppingCartItems}/$page",
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> removeItem(int id) async {
    final res = await delete(
      "${AppLinksApi.shoppingCartRemoveItems}/$id",
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> updateQuantity(int id, int quantity) async {
    final res = await put(
      AppLinksApi.shoppingCartUpdateItem,
      {"id": id, "quantity": quantity},
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }
}
