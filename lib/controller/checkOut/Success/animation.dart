import 'package:flutter/cupertino.dart';

class SuccsesOrderAnimation {
  late AnimationController animationController;

  AnimationController initialAnimationController(TickerProvider vsycn) {
    const duration = Duration(milliseconds: 700);
    animationController = AnimationController(vsync: vsycn, duration: duration);
    return animationController;
  }

  AnimationController getInstance() => animationController;

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
