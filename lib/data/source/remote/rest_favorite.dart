import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:get/get.dart';

class RestFavorite extends GetConnect {
  MyServices myServices = Get.find<MyServices>();

  Future<StatusRequest> getfavoriteItems({int index = 0}) async {
    final String cookie = myServices.sharedPreferences.getString("cookie")!;
    Response res = await get(
      AppLinksApi.favorite,
      headers: {"Cookie": cookie, "index": "$index"},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> removeItem(String itemId) async {
    Response res = await post(
      AppLinksApi.favoriteRemove,
      {"item_id": itemId},
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> addToFavorite(int itemId) async {
    Response res = await post(
      AppLinksApi.addToFavorite,
      {"item_id": itemId},
      headers: {"Cookie": Shared.cookie!},
    );
    return handleApiResponce(res);
  }
}
