import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/constant/api_links.dart';
import 'package:ecommercecourse/core/functions/handing_api_responce.dart';
import 'package:get/get.dart';

class RestForgetPassword extends GetConnect {
  Future<StatusRequest> sendVerfycode(String email) async {
    Response res = await post(
      AppLinksApi.forgetPasswordSendVerifyCode,
      {"user_email": email},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> verifyCode(String email, String code) async {
    Response res = await post(
      AppLinksApi.forgetPasswordVerifyCode,
      {"user_email": email, "code": code},
    );
    return handleApiResponce(res);
  }

  Future<StatusRequest> resetPassword(
    String accessToken,
    String email,
    String newPassword,
  ) async {
    Response res = await post(
      AppLinksApi.resetPassword,
      {
        "access_token": accessToken,
        "user_email": email,
        "user_password": newPassword,
      },
    );
    return handleApiResponce(res);
  }
}
