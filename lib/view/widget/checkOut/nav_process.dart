import 'package:ecommercecourse/controller/checkOut/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavCheckOutProcess extends StatelessWidget {
  const NavCheckOutProcess({Key? key}) : super(key: key);

  Widget stepDashed(int index, int step) {
    bool isActive = step >= (index + 1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: List.generate(
          7,
          (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              width: 7.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: isActive ? AppColor.appBarColord : AppColor.appBarColord.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.0),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget stepIcon(int index, int step, IconData icon) {
    bool isActive = step > index;
    return Icon(
      icon,
      color: isActive ? AppColor.appBarColord : AppColor.appBarColord.withOpacity(0.3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ChekOutViewController>(builder: (con) {
      final int step = (con.currentPage.value + 1);
      return Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 25),
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stepIcon(1, step, Icons.location_pin),
            stepDashed(1, step),
            stepIcon(2, step, Icons.payment),
            stepDashed(2, step),
            stepIcon(3, step, Icons.done),
          ],
        ),
      );
    });
  }
}
