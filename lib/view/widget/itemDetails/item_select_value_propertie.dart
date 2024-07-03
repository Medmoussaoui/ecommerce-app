import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomSelectValuePropertieItemDetail extends StatelessWidget {
  final bool isSelect;
  final String value;
  final void Function()? onTap;

  const CustomSelectValuePropertieItemDetail({
    Key? key,
    required this.value,
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
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelect ? AppColor.primaryColor : null,
          border: isSelect ? null : Border.all(color: AppColor.grey1, width: 0.5),
        ),
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSelect ? Colors.white : AppColor.blackGrey,
              ),
        ),
      ),
    );
  }
}
