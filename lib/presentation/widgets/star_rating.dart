import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;

  const StarRating(
      {super.key, this.starCount = 5, this.rating = .0, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star,
        color: Colors.grey.withOpacity(0.2),
        size: 20,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 20,
      );
    } else {
      icon = const Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
