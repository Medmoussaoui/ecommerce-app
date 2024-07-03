import 'package:ecommercecourse/controller/checkOut/Success/index.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/successOrders/need_help.dart';
import 'package:ecommercecourse/view/widget/successOrders/order_number.dart';
import 'package:ecommercecourse/view/widget/successOrders/thanks_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutSccessScreen extends StatefulWidget {
  const CheckOutSccessScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutSccessScreen> createState() => _CheckOutSccessScreenState();
}

class _CheckOutSccessScreenState extends State<CheckOutSccessScreen> with SingleTickerProviderStateMixin {
  late SuccessOrderScreenController controller;
  late AnimationController _animationController;
  late Animation<double> _opaticy;
  late Animation<double> _movey;

  @override
  void initState() {
    controller = Get.put(SuccessOrderScreenController());
    _animationController = controller.animation.initialAnimationController(this);

    _opaticy = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0),
      ),
    )..addListener(() => setState(() {}));

    _movey = Tween(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0),
      ),
    )..addListener(() => setState(() {}));
    controller.animation.startAnimationOpenScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Expanded(child: ThanksMessage()),
              Expanded(
                child: Opacity(
                  opacity: _opaticy.value,
                  child: Transform.translate(
                    offset: Offset(0.0, _movey.value),
                    child: Column(
                      children: [
                        const Spacer(),
                        const OrderNumber(),
                        const Spacer(),
                        const CustomNeedHelpButton(),
                        CustomPrimaryButton(onPressed: () {}, buttonText: "Back to home"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
