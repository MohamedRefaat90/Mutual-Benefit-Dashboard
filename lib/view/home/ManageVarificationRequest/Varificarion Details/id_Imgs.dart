import 'package:flutter/material.dart';

class id_Imgs extends StatelessWidget {
  const id_Imgs({
    super.key,
    required this.img,
    required this.lable,
  });

  final String lable;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.network(img, width: 250, height: 125, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
