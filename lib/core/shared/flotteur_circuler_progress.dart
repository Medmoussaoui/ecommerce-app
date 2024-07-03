import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomFlotteurProgressIndicator extends StatefulWidget {
  final double size;
  final Color? color;
  const CustomFlotteurProgressIndicator({Key? key, this.size = 18, this.color}) : super(key: key);

  @override
  State<CustomFlotteurProgressIndicator> createState() => _CustomFlotteurProgressIndicatorState();
}

class _CustomFlotteurProgressIndicatorState extends State<CustomFlotteurProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
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
    return Container(
      height: widget.size,
      width: widget.size,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 2.5,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: opacityAnimation,
        builder: (BuildContext context, child) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.color ?? AppColor.primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
