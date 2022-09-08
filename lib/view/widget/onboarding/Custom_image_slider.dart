import 'package:flutter/cupertino.dart';

class CustomImageSlider extends StatefulWidget {
  final String imagePath;
  const CustomImageSlider({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> dx;
  late Animation<double> opacity;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    dx = Tween<double>(begin: 70.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() => setState(() {}));

    opacity = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(dx.value, 0.0),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Opacity(
            opacity: opacity.value, child: Image.asset(widget.imagePath)),
      ),
    );
  }
}
