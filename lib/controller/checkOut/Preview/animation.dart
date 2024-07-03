import 'package:flutter/cupertino.dart';

class PreviewScreenAnimationController {
  late AnimationController animationBottomBarController;

  AnimationController initialAnimationController(TickerProvider vsycn) {
    const duration = Duration(milliseconds: 700);
    animationBottomBarController = AnimationController(vsync: vsycn, duration: duration);
    return animationBottomBarController;
  }

  Future<void> startAnimationOpenScreen() async {
    await animationBottomBarController.forward();
  }

  Future<void> startAnimationCloseScreen() async {
    await animationBottomBarController.reverse();
  }

  dispose() {
    animationBottomBarController.dispose();
  }
}
