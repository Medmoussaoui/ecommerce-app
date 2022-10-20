import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:ecommercecourse/view/widget/onboarding/custom_slider.dart';
import 'package:ecommercecourse/view/widget/onboarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final controller = Get.put(OnBoardingController());

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
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CustomDotControllerOnBoarding(),
                    const Spacer(),
                    GetX<OnBoardingController>(
                      builder: (con) {
                        return CustomPrimaryButton(
                          buttonText: con.currentPage.value ==
                                  (onBoardingList.length - 1)
                              ? '5'.tr
                              : '6'.tr,
                          onPressed: () {
                            controller.animateToNextScreen();
                          },
                        );
                      },
                    ),
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
