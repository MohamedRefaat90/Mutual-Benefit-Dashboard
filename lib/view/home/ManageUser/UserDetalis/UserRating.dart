import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class userRating extends StatelessWidget {
  const userRating({
    super.key,
    required this.Rating,
  });
  final double Rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: Rating,
      minRating: 1,
      direction: Axis.horizontal,
      itemSize: 25,
      ignoreGestures: true,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.only(right: 4.0, bottom: 10),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (value) {},
    );
  }
}
