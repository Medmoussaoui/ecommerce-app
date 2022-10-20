import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:get/get.dart';

class RestSignUp {
  static ApiConnect connect = Get.find();

  static Future<StatusRequest> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    Response res = await connect.post(
      AppLinksApi.signUp,
      {
        "user_first_name": firstName,
        "user_last_name": lastName,
        "user_email": email,
        "user_password": password,
      },
    );
    return handleApiResponce(res);
  }

  static Future<StatusRequest> sendVerifyCode(String email) async {
    Response res = await connect.post(
      AppLinksApi.sendVerifyCode,
      {"user_email": email},
    );
    return handleApiResponce(res);
  }

  static Future<StatusRequest> verifyCode(String email, String code) async {
    Response res = await connect.post(
      AppLinksApi.verifyCode,
      {
        "user_email": email,
        "code": code,
      },
    );
    return handleApiResponce(res);
  }
}
