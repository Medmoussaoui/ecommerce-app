import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/payment/CreditCart/index.dart';
import 'package:ecommercecourse/view/widget/payment/PaymentMethodes/index.dart';
import 'package:ecommercecourse/view/widget/payment/cash_on_delivery.dart';
import 'package:ecommercecourse/view/widget/payment/paypal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with SingleTickerProviderStateMixin {
  late PaymentScreenContoller controller;
  late AnimationController _controller;
  late Animation<double> opacityBody;
  late Animation<double> opacityBottomButton;
  late Animation<double> movey;
  late Animation<double> movex;

  setUpValue() {}

  @override
  void initState() {
    controller = Get.put(PaymentScreenContoller());

    _controller = controller.animation.initialAnimationController(this);

    opacityBody = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0),
      ),
    )..addListener(
        () => setState(() {}),
      );

    opacityBottomButton = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    )..addListener(
        () => setState(() {}),
      );

    movex = Tween<double>(begin: 20, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7),
      ),
    )..addListener(
        () => setState(() {}),
      );

    movey = Tween<double>(begin: 20, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    )..addListener(
        () => setState(() {}),
      );

    controller.animation.startAnimationOpenScreen();
    super.initState();
  }

  String _bottomNavigationBarTitle() {
    return controller.updateMode ? "Update" : "Continue To Preview";
  }

  Color? _buttonColor() {
    // Button Default Propertes
    // Color : Null , Take Primary Color if Null
    if (controller.updateMode) return AppColor.appBarColord;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, movey.value),
        child: Opacity(
          opacity: opacityBottomButton.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomPrimaryButton(
              color: _buttonColor(),
              buttonText: _bottomNavigationBarTitle(),
              onPressed: () {
                controller.continueToPreview();
              },
            ),
          ),
        ),
      ),
      body: Transform.translate(
        offset: Offset(movex.value, 0.0),
        child: Opacity(
          opacity: opacityBody.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SelectPaymentMethode(),
                GetBuilder<PaymentScreenContoller>(
                  builder: (con) {
                    switch (con.paymentMethode.value) {
                      case 3:
                        return const PaymentCreditCartInformation();
                      case 2:
                        return const Paypal();
                      case 1:
                        return const CashOnDelivery();
                      default:
                        return const Text("<Not Implemented yet>");
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
