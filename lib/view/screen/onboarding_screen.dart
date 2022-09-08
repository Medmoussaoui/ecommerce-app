import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/view/widget/onboarding/Custom_button.dart';
import 'package:ecommercecourse/view/widget/onboarding/custom_slider.dart';
import 'package:ecommercecourse/view/widget/onboarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final putController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
            bottom: 15,
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(),
                    CustomButtonOnBoarding(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
