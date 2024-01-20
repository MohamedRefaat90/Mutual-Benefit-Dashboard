
import 'package:flutter/material.dart';

class Details_IconBtn extends StatelessWidget {
  const Details_IconBtn({
    super.key,
    required this.press,
    required this.icon,
    required this.color,
  });
  final void Function()? press;
  final Widget icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      splashRadius: 20,
      icon: icon,
      color: color,
      splashColor: Colors.black54,
    );
  }
}
