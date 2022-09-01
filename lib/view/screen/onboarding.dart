import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:ecommercecourse/view/widget/onboarding/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onBoardingList.length,
                  itemBuilder: (context, i) {
                    return OnDoardingWidget(index: i);
                  },
                ),
              ),
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
              const SizedBox(height: 30),
              MaterialButton(
                height: 54.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0)),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: const Text('START'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
