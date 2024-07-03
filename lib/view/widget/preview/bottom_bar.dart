import 'package:ecommercecourse/controller/checkOut/Preview/index.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';

class PreviewBottomBar extends StatefulWidget {
  final PreviewController controller;
  const PreviewBottomBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<PreviewBottomBar> createState() => _PreviewBottomBarState();
}

class _PreviewBottomBarState extends State<PreviewBottomBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _height;
  late Animation<double> _opacity;

  @override
  void initState() {
    _animationController = widget.controller.animation.initialAnimationController(this);
    _height = Tween<double>(begin: 0.0, end: 240).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.5),
    ))
      ..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1.0),
    ))
      ..addListener(() {
        setState(() {});
      });

    widget.controller.animation.startAnimationOpenScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height.value,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4, spreadRadius: 2.0),
        ],
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxHeight == 240) {
          final priceTextTheme = Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.5);
          return Opacity(
            opacity: _opacity.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAuthTitle(title: "Order Summary", fontSize: 16.0),
                          const Spacer(flex: 2),
                          Row(
                            children: [
                              const CustomSubTitle(subtitle: "SubTotal"),
                              const Spacer(),
                              CustomSubTitle(subtitle: "\$ 10.0", style: priceTextTheme),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const CustomSubTitle(subtitle: "Delivery"),
                              const Spacer(),
                              CustomSubTitle(subtitle: "\$ 15.0", style: priceTextTheme),
                            ],
                          ),
                          const Spacer(flex: 2),
                          Row(
                            children: const [
                              CustomAuthTitle(title: "Total", fontSize: 18.5),
                              Spacer(),
                              CustomAuthTitle(title: "\$ 150.0", fontSize: 18.5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomPrimaryButton(
                    buttonText: "Submit Order",
                    topPadding: 15,
                    bottomPadding: 0.0,
                    onPressed: () {
                      widget.controller.submitOrder();
                    },
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
