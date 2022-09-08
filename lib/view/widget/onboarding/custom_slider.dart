import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingController> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.onSwipe(index);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              onBoardingList[index].title,
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 20.0,
                color: AppColor.blackGrey,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(onBoardingList[index].imagePath),
            ),
            const Spacer(),
            Text(
              onBoardingList[index].body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w500,
                color: AppColor.grey,
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
