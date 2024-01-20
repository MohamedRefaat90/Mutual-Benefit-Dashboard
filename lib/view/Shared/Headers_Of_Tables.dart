// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Headers_Of_Tables extends StatelessWidget {
  const Headers_Of_Tables({
    Key? key,
    required this.Lables,
  }) : super(key: key);
  final List<Widget> Lables;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Lables,
      ),
    );
  }
}
