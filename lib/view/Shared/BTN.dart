import 'package:flutter/material.dart';

class BTN extends StatelessWidget {
  BTN({
    super.key,
    required this.lable,
    this.press,
    this.color,
  });
  final String lable;
  Color? color;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      color: color?? Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        lable,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
