import 'package:ecommercecourse/core/functions/alert_confirm_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> confirmExitApp() async {
  bool exit = false;
  await customalertDialogSimpleConfirm(
    icon: const Icon(Icons.exit_to_app),
    title: "Attention!",
    subTitle: "Do you want to exit app",
    onConfirm: () => exit = true,
  );
  return exit;
}
