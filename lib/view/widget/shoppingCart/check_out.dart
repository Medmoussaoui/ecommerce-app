import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShoppingCardCheckOut extends StatefulWidget {
  const CustomShoppingCardCheckOut({Key? key}) : super(key: key);

  @override
  State<CustomShoppingCardCheckOut> createState() => _CustomShoppingCardCheckOutState();
}

class _CustomShoppingCardCheckOutState extends State<CustomShoppingCardCheckOut> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacity;
  late Animation<double> moveFromy;

  showCheckOut() async {
    final con = Get.find<ShoppringCartController>();
    if (con.items.isNotEmpty) return _controller.forward();
    if (_controller.isCompleted) return unShowCheckOut();
  }

  unShowCheckOut() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _controller.reverse();
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    moveFromy = Tween<double>(begin: 210, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.400, curve: Curves.easeIn),
      ),
    )..addListener(
        () => setState(() {}),
      );
    // Opacity
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.400, 1.0, curve: Curves.linear),
      ),
    )..addListener(
        () => setState(() {}),
      );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppringCartController>(
      id: "checkOut",
      builder: (con) {
        showCheckOut();
        return Transform.translate(
          offset: Offset(0.0, moveFromy.value),
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 10.0),
            height: 200,
            decoration: BoxDecoration(
              color: AppColor.appBarColord,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 4.0,
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Opacity(
              opacity: opacity.value,
              child: Column(
                children: [
                  /// Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSubTitle(
                        subtitle: "Total ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white30,
                            ),
                      ),
                      GetX<ShoppringCartController>(builder: (con) {
                        return CustomSubTitle(
                          subtitle: "\$ ${con.total} ",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white60, fontSize: 16.0),
                        );
                      })
                    ],
                  ),

                  /// Total Discount
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSubTitle(
                        subtitle: "Total Discount ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white30,
                            ),
                      ),
                      GetX<ShoppringCartController>(builder: (con) {
                        return CustomSubTitle(
                          subtitle: "\$ -${con.totalDiscount}",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white60, fontSize: 16.0),
                        );
                      }),
                    ],
                  ),

                  /// Final Total
                  const Divider(color: Colors.white12, height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSubTitle(
                        subtitle: "Final Total",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white60,
                              fontSize: 17.0,
                            ),
                      ),
                      GetX<ShoppringCartController>(builder: (con) {
                        return CustomSubTitle(
                          subtitle: "\$ ${con.finalTotal} ",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 21.0,
                              ),
                        );
                      })
                    ],
                  ),

                  /// CHECK OUT BUTTON
                  const Spacer(),
                  CustomPrimaryButton(
                    bottomPadding: 0.0,
                    buttonText: "Check out",
                    onPressed: () {
                      con.checkOut.onPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
