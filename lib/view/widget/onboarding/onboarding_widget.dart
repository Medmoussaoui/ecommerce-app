import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/data/source/static/onboarding_data.dart';
import 'package:flutter/cupertino.dart';

class OnDoardingWidget extends StatelessWidget {
  final int index;
  const OnDoardingWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          onBoardingList[index].title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(onBoardingList[index].imagePath),
        ),
        Text(
          onBoardingList[index].body,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14.5),
        ),
      ],
    );
  }
}
