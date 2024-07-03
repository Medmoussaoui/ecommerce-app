import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final BoxShape shapeBorder;
  final bool enable;
  final Color? baseColor;
  final Color? highlightColor;

  const CustomShimmerWidget.rectangle({
    Key? key,
    required this.height,
    this.width = double.infinity,
    this.shapeBorder = BoxShape.rectangle,
    this.enable = true,
    this.radius = 0.0,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  const CustomShimmerWidget.circule({
    Key? key,
    required this.height,
    required this.width,
    this.shapeBorder = BoxShape.circle,
    this.enable = true,
    this.baseColor,
    this.highlightColor,
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[200]!,
      highlightColor: highlightColor ?? Colors.grey[300]!,
      enabled: enable,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shapeBorder,
          color: baseColor ?? Colors.grey[200],
          borderRadius: shapeBorder == BoxShape.circle ? null : BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
