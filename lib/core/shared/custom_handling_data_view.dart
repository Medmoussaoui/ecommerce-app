import 'package:ecommercecourse/core/class/api_connection.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';

class CustomHandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget dataWidget;
  final Widget noDataWidget;
  final Widget loadingWidget;

  final Widget defaultWidget;
  final Widget noInternetWidget;

  const CustomHandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.dataWidget,
    this.noDataWidget = const Center(child: Text("No Data")),
    this.noInternetWidget = const Center(child: Text("No Internet")),
    this.loadingWidget = const Center(child: CustomProgressIndicator()),
    this.defaultWidget = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statusRequest.isLoading) {
      return loadingWidget;
    }

    if (statusRequest.isSuccess) {
      if (statusRequest.data.isNotEmpty) return dataWidget;
      return noDataWidget;
    }

    if (statusRequest.isConnectionError) {
      return noInternetWidget;
    }

    return const SizedBox.shrink();
  }
}
