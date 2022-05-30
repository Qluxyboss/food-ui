import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  final int ratings;

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 0; i < ratings; i++) {
      stars += "⭐ ";
    }
    stars.trim();
    return Text(stars);
  }
}
