import 'package:flutter/material.dart';

class CheckOutFormFails extends StatelessWidget {
  const CheckOutFormFails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.grey[300]!, width: 0.5),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
