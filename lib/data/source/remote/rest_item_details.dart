import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:get/get.dart';

class RestItemDetails extends GetConnect {
  Future<StatusRequest> addToCart(String itemId) async {
    Response res = await post(
      AppLinksApi.addToCart,
      {
        "item_id": itemId,
        "quantity": 1,
        "properties": {},
      },
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }
}
