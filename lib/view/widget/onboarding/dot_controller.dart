import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OnBoardingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardingList.length,
            (index) {
              return AnimatedContainer(
                margin: const EdgeInsets.only(right: 3.5),
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                height: 7.0,
                width: (controller.currentPage.value == index) ? 12.0 : 7.0,
                decoration: BoxDecoration(
                  color: (controller.currentPage.value == index)
                      ? AppColor.primaryColor
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
