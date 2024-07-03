import 'package:flutter/material.dart';

class CustomStarsRating extends StatelessWidget {
  final double rating;
  const CustomStarsRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_rate_rounded,
          size: 19,
          color: ((index + 1) <= rating) ? Colors.yellow[700] : Colors.grey[300],
        ),
      ),
    );
  }
}
