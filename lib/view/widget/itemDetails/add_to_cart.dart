import 'package:ecommercecourse/controller/ItemDetails/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/itemDetails/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartItemDetail extends StatefulWidget {
  const AddToCartItemDetail({Key? key}) : super(key: key);

  @override
  State<AddToCartItemDetail> createState() => _AddToCartItemDetailState();
}

class _AddToCartItemDetailState extends State<AddToCartItemDetail> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacity;
  late Animation<double> moveFromy;

  showAddToCart() async {
    final fromShoppingCart = Get.find<ItemDetailsController>().checkIfComesFromShoppingCart();
    if (fromShoppingCart) return;
    await Future.delayed(const Duration(milliseconds: 600));
    _controller.forward();
  }

  unShowAddToCart() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _controller.reverse();
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    moveFromy = Tween<double>(begin: 80, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1, curve: Curves.linear),
      ),
    )..addListener(
        () => setState(() {}),
      );
    // Opacity
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.linear),
      ),
    )..addListener(
        () => setState(() {}),
      );
    showAddToCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
      child: Transform.translate(
        offset: Offset(0.0, moveFromy.value),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 85,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.appBarColord,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6.5,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            children: const [
              CustomAuthTitle(
                title: "\$ 1500.0",
                fontSize: 21.0,
                color: Colors.white,
              ),
              SizedBox(width: 15.0),
              Expanded(child: CustomItemDetailAddToCartButton()),
            ],
          ),
        ),
      ),
    );
  }
}
