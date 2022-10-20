import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:get/get.dart';

StatusRequest handleApiResponce(Response responce) {
  final StatusRequest statusRequest = StatusRequest(data: responce.body);
  if (responce.status.connectionError) {
    return statusRequest.connectionError();
  }

  if (responce.hasError) {
    return statusRequest.respondError();
  }

  if (responce.statusCode! >= 500) {
    return statusRequest.serverFailer();
  }

  return statusRequest.success();
}
