import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Components/StaticsCard.dart';
import 'package:shimmer/shimmer.dart';

class DashboardStatics extends StatefulWidget {
  const DashboardStatics({
    super.key,
  });

  @override
  State<DashboardStatics> createState() => _DashboardStaticsState();
}

class _DashboardStaticsState extends State<DashboardStatics> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  CollectionReference admins = FirebaseFirestore.instance.collection('Admins');
  CollectionReference countries =
      FirebaseFirestore.instance.collection('Countries');

  @override
  Widget build(BuildContext context) {
    List StaticsLables = [
      "Total Users",
      "Total Orders",
      "Total Admins",
      "Total Countries"
    ];
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Logo.jpg'), fit: BoxFit.cover)),
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.8),
          itemCount: StaticsLables.length,
          itemBuilder: (BuildContext context, int i) => FutureBuilder(
                future: i == 0
                    ? users.get()
                    : i == 1
                        ? orders.get()
                        : i == 2
                            ? admins.get()
                            : countries.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return StaticsCard(
                        index: i,
                        lable: StaticsLables[i],
                        value: snapshot.data!.docs.length);
                  } else {
                    return SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        child: Container(
                          width: 200.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    );
                  }
                },
              )),
    );
  }
}
