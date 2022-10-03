import 'package:ecommercecourse/core/functions/alert_confirm_dialog.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('For Test widgets'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Shop dialog'),
              onPressed: () {
                alertDialogSimpleConfirm(
                  title: 'Attention!',
                  subTitle:
                      'Are you sure you want to exit app press accpet or discard that',
                  confirmText: "Delete",
                  cancelText: 'Discard',
                  icon: const Icon(Icons.exit_to_app_rounded),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
