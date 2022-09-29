import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double size;
  const CustomProgressIndicator({Key? key, this.size = 17}) : super(key: key);

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnimation,
      builder: (BuildContext context, child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: SizedBox(
            height: widget.size,
            width: widget.size,
            child: const CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          ),
        );
      },
    );
  }
}
