import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartIconCount extends Icon {
  const ShoppingCartIconCount({Key? key}) : super(key: key, Icons.shopping_cart_outlined);

  @override
  Color? get color => Colors.white;

  Widget _shoppingCount(ShoppringCartController con) {
    if (con.items.isEmpty) return const SizedBox.shrink();
    return Positioned(
      left: 16,
      bottom: 22,
      child: CircleAvatar(
        radius: 7.5,
        backgroundColor: Colors.red,
        child: Center(
          child: Text(
            con.items.length.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppringCartController>(
      id: "cartIcon",
      builder: (con) {
        return SizedBox(
          height: 37,
          width: 37,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(super.icon, color: super.color),
              _shoppingCount(con),
            ],
          ),
        );
      },
    );
  }
}
