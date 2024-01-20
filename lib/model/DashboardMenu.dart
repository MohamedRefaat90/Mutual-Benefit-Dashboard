import 'package:dashbord/view/home/home.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> menuList = [
  {
    "lable": "Dashboard",
    "icon": Icons.dashboard,
    "press": () => PageViewController.animateToPage(0,
        duration: Duration(milliseconds: transitionDuration),
        curve: Curves.easeIn)
  },
  {
    "lable": "Manage Users",
    "icon": Icons.groups_2,
    "press": () => PageViewController.animateToPage(1,
        duration: Duration(milliseconds: transitionDuration),
        curve: Curves.easeIn)
  },
  {
    "lable": "Manage Orders",
    "icon": Icons.shopping_bag,
    "press": () => PageViewController.animateToPage(2,
        duration: Duration(milliseconds: transitionDuration),
        curve: Curves.easeIn)
  },
  {
    "lable": "Manage Varification Requests",
    "icon": Icons.trending_up,
    "press": () => PageViewController.animateToPage(3,
        duration: Duration(milliseconds: transitionDuration),
        curve: Curves.easeIn)
  },
  {
    "lable": "Manage Admin",
    "icon": Icons.admin_panel_settings_outlined,
    "press": () => PageViewController.animateToPage(4,
        duration: Duration(milliseconds: transitionDuration),
        curve: Curves.easeIn)
  },
];
