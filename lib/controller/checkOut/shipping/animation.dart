import 'package:flutter/cupertino.dart';

class ShippingAnimation {
  late AnimationController animationController;

  AnimationController initialAnimationController(TickerProvider vsycn) {
    const duration = Duration(milliseconds: 700);
    animationController = AnimationController(vsync: vsycn, duration: duration);
    return animationController;
  }

  startAnimationOpenScreen() {
    animationController.forward();
  }

  startAnimationCloseScreen() async {
    await animationController.reverse();
  }

  dispose() {
    animationController.dispose();
  }
}
