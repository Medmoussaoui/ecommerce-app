import 'package:get/get.dart';

enum ConnectionStatus {
  loading,
  connectionError,
  serverFailer,
  respondError,
  success,
  none,
}

class StatusRequest {
  ConnectionStatus connectionStatus;
  dynamic data;

  StatusRequest({this.connectionStatus = ConnectionStatus.none, this.data});

  get isRespondError => connectionStatus == ConnectionStatus.respondError;

  get isConnectionError => connectionStatus == ConnectionStatus.connectionError;

  get isServerFailer => connectionStatus == ConnectionStatus.serverFailer;

  get isSuccess => connectionStatus == ConnectionStatus.success;

  get isLoading => connectionStatus == ConnectionStatus.loading;

  get isNone => connectionStatus == ConnectionStatus.none;

  StatusRequest success() {
    connectionStatus = ConnectionStatus.success;
    return this;
  }

  StatusRequest loading() {
    connectionStatus = ConnectionStatus.loading;
    return this;
  }

  StatusRequest serverFailer() {
    connectionStatus = ConnectionStatus.serverFailer;
    return this;
  }

  StatusRequest respondError() {
    connectionStatus = ConnectionStatus.respondError;
    return this;
  }

  StatusRequest connectionError() {
    connectionStatus = ConnectionStatus.connectionError;
    return this;
  }
}

class ApiConnect extends GetConnect {}
