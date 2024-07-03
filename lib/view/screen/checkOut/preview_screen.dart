import 'package:ecommercecourse/controller/checkOut/Preview/index.dart';
import 'package:ecommercecourse/view/widget/preview/bottom_bar.dart';
import 'package:ecommercecourse/view/widget/preview/note_text.dart';
import 'package:ecommercecourse/view/widget/preview/review_paymeent_info.dart';
import 'package:ecommercecourse/view/widget/preview/review_shipping_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PreviewController());
    return Scaffold(
      bottomNavigationBar: PreviewBottomBar(controller: controller),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: const [
            PreviewNoteText(),
            SizedBox(height: 20),
            ReviewPaymentInfo(),
            SizedBox(height: 20),
            ReviewShippingInfo(),
          ],
        ),
      ),
    );
  }
}
