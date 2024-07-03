import 'package:ecommercecourse/controller/checkOut/shipping/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/shipping/address_form.dart';
import 'package:ecommercecourse/view/widget/shipping/city_and_zip_code.dart';
import 'package:ecommercecourse/view/widget/shipping/drop_down_menu.dart';
import 'package:ecommercecourse/view/widget/shipping/first_name_and_last_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> with SingleTickerProviderStateMixin {
  late ShippingController controller;
  late AnimationController _controller;
  late Animation<double> opacityBody;
  late Animation<double> opacityBottomButton;
  late Animation<double> movey;
  late Animation<double> movex;

  @override
  void initState() {
    controller = Get.put(ShippingController());

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
    return controller.updateMode ? "Update" : "Continue To Payment";
  }

  Color? _buttonColor() {
    // Button Default Properte
    // Color : Null <= Take Primary Color if Null
    if (controller.updateMode) return AppColor.appBarColord;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, movey.value),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Opacity(
            opacity: opacityBottomButton.value,
            child: CustomPrimaryButton(
              color: _buttonColor(),
              buttonText: _bottomNavigationBarTitle(),
              onPressed: () {
                controller.continueToPayment();
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
              children: const [
                ShippingFirstNameAndLastName(),
                SizedBox(height: 15),
                ShippingAddressForm(),
                SizedBox(height: 15),
                ShippingCityAndZipCode(),
                SizedBox(height: 15),
                ShippingDropDownMenu(
                  title: "Country",
                  value: "Morroco",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
