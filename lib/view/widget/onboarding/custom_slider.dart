import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:ecommercecourse/view/widget/onboarding/Custom_image_slider.dart';
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
            Text(onBoardingList[index].title,
                style: Theme.of(context).textTheme.headline1),
            const Spacer(),
            CustomImageSlider(imagePath: onBoardingList[index].imagePath),
            const Spacer(),
            Text(
              onBoardingList[index].body,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
