import 'package:flutter/material.dart';

class StaticsCard extends StatelessWidget {
  const StaticsCard({
    super.key,
    required this.index, required this.lable, required this.value,
  });

  final int index;
  final String lable;
  final int value;

  @override
  Widget build(BuildContext context) {
    // print(usersListLength);
    return Container(
      width: 70,
      height: 50,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(children: [
            Text(
              "$value",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(),
            const Icon(
              Icons.trending_up,
              color: Colors.white,
            )
          ])
        ],
      ),
    );
  }
}
