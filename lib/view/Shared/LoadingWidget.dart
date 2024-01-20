import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[400]!,
        child: Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}