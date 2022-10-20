import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:get/get.dart';

class RestSignIn {
  ApiConnect connect = Get.find();

  Future<StatusRequest> signIn(String email, String password) async {
    Response res = await connect.post(
      AppLinksApi.signIn,
      {"user_email": email, "user_password": password},
    );
    return handleApiResponce(res);
  }
}
