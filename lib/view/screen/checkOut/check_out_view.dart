import 'package:ecommercecourse/controller/checkOut/index.dart';
import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/controller/checkOut/shipping/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/checkOut/payment_screen.dart';
import 'package:ecommercecourse/view/screen/checkOut/preview_screen.dart';
import 'package:ecommercecourse/view/screen/checkOut/shipping_screen.dart';
import 'package:ecommercecourse/view/screen/checkOut/success_screen.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/checkOut/nav_process.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChekOutViewController controller = Get.put(ChekOutViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: const CustomAuthTitle(
          title: "Shipping",
          color: AppColor.appBarColord,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return await controller.willPop();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: NavCheckOutProcess()),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ShippingScreen(),
                  PaymentScreen(),
                  PreviewScreen(),
                  CheckOutSccessScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
