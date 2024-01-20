import 'package:dashbord/view/Login/loginScreen.dart';
import 'package:dashbord/view/home/ManageAdmins/ManageAdmins.dart';
import 'package:dashbord/view/home/drawer/drawer.dart';
import 'package:flutter/material.dart';

import 'DashboardStatistics/DashBoardStatistics.dart';
import 'ManageOrders/ManageOrders.dart';
import 'ManageUser/ManageUser.dart';
import 'ManageVarificationRequest/ManageVarificationRequest.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = "home";

  @override
  State<Home> createState() => _HomeState();
}

PageController PageViewController = PageController();
int transitionDuration = 50;

class _HomeState extends State<Home> {
  @override
  void dispose() {
    PageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
              color: Colors.red,
              child: const Text("Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)))
        ],
      ),
      body: Row(
        children: [
          const drawer(),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: PageView(
                  controller: PageViewController,
                  children:  [
                    const DashboardStatics(),
                    const ManageUser(),
                    const ManageOrders(),
                    const ManageVarificationRequest(),
                    ManageAdmins(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
