import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/constant/shared.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:ecommercecourse/data/module/suggestion_search_item.dart';
import 'package:get/get.dart';

class RestSearch extends GetConnect {
  Future<StatusRequest> searchKeywords(String searchInput) async {
    Response res = await get(
      AppLinksApi.search,
      headers: {
        "Cookie": Shared.cookie!,
        "searchInput": searchInput,
      },
    );

    final handleResponce = handleApiResponce(res);
    if (handleResponce.isSuccess && handleResponce.hasData) {
      handleResponce.data = decoder(handleResponce.data);
    }
    return handleResponce;
  }

  decoder(List<dynamic> data) {
    return List.generate(
      data.length,
      (index) {
        return SuggestionSearchItem.fromJson(data[index]);
      },
    );
  }
}
