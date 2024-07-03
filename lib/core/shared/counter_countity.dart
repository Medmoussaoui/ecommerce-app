import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:flutter/material.dart';

class CounterQuantityWidget extends StatefulWidget {
  final void Function(int value) onChange;
  final int max;
  final int min;
  final int initialValue;
  const CounterQuantityWidget({
    Key? key,
    required this.initialValue,
    required this.onChange,
    this.max = -1,
    this.min = 1,
  }) : super(key: key);

  @override
  State<CounterQuantityWidget> createState() => _CounterQuantityWidgetState();
}

class _CounterQuantityWidgetState extends State<CounterQuantityWidget> {
  late int counter = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (counter - 1 < widget.min) return;
            counter--;
            setState(() {});
            widget.onChange(counter);
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: AppColor.grey1),
            ),
            child: const Icon(
              Icons.remove_rounded,
              color: AppColor.grey1,
              size: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomAuthTitle(
            title: "$counter",
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.max != -1 && (counter + 1) > widget.max) return;
            counter++;
            setState(() {});
            widget.onChange(counter);
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
