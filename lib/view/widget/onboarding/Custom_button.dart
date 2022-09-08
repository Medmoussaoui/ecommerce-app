import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingController> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OnBoardingController>(
      builder: (con) {
        print('Costom button is Rebuild');
        return MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text(
            con.currentPage.value == (onBoardingList.length - 1)
                ? 'Skip'
                : 'Continue',
            style: const TextStyle(fontSize: 15.0),
          ),
          onPressed: () {
            controller.next();
          },
        );
      },
    );
  }
}
