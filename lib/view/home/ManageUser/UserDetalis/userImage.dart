import 'package:flutter/material.dart';


class userImage extends StatelessWidget {
  const userImage({
    super.key,
    required this.imgURL,
  });
  final String imgURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(width: 2)),
      child: Image.network(imgURL, fit: BoxFit.cover,),
    );
  }
}
