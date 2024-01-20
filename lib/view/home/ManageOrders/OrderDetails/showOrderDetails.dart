// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:dashbord/model/orderModel.dart';

import '../../../Shared/detailsHeader.dart';
import 'orderDetails_Info.dart';

Future<dynamic> showOrderDetails(BuildContext context, orderModel orderData) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Details_Header(lable: "Order Details"),
            content: SingleChildScrollView(
              child: orderDetails_Info(order: orderData),
            ),
          ));
}
