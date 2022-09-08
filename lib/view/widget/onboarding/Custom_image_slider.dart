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
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
