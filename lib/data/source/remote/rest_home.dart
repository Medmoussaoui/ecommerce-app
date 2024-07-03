import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:ecommercecourse/data/module/category_module.dart';
import 'package:ecommercecourse/data/module/item_product_module.dart';
import 'package:get/get.dart';

class RestHome extends GetConnect {
  Future<StatusRequest> initialHome() async {
    Response res = await get(AppLinksApi.initialHome, headers: {
      "Cookie": Shared.cookie!,
    });

    final handleResponce = handleApiResponce(res);

    if (handleResponce.isSuccess && handleResponce.hasData) {
      // Items Data
      handleResponce.data['items'] = List.generate(
        handleResponce.data['items'].length,
        (index) => ItemModule.fromJeson(handleResponce.data['items'][index]),
      );

      // Categorys Data
      handleResponce.data['categorys'] = List.generate(
        handleResponce.data['categorys'].length,
        (index) => CategoryModule.fromJson(handleResponce.data['categorys'][index]),
      );
    }
    return handleResponce;
  }

  Future<StatusRequest> loadProducts(
    String itemName,
    int index,
    String? categoryId,
  ) async {
    Response res = await get(AppLinksApi.products, headers: {
      "Cookie": Shared.cookie!,
      "itemName": itemName,
      "index": "$index",
      "categoryId": categoryId ?? "",
    });

    final handleResponce = handleApiResponce(res);

    if (handleResponce.isSuccess && handleResponce.hasData) {
      handleResponce.data = List.generate(
        handleResponce.data.length,
        (index) => ItemModule.fromJeson(handleResponce.data[index]),
      );
    }
    return handleResponce;
  }
}
