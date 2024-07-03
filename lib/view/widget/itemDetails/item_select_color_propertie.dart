import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomSelectColorPropertieItemDetail extends StatelessWidget {
  final bool isSelect;
  final Color color;
  final void Function()? onTap;
  const CustomSelectColorPropertieItemDetail({
    Key? key,
    required this.color,
    required this.isSelect,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
        width: isSelect ? 45 : 40,
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelect ? Border.all(color: AppColor.blackGrey, width: 1.3) : null,
        ),
        child: Container(
          height: isSelect ? 45 : 40,
          width: isSelect ? 45 : 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: isSelect
              ? const Icon(
                  Icons.done_rounded,
                  size: 16,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
