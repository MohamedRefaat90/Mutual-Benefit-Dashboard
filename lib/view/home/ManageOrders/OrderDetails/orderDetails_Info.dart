import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../model/orderModel.dart';
import '../../../Shared/detailsTextField.dart';
import '../../../Shared/BTN.dart';

class orderDetails_Info extends StatelessWidget {
  @override
  final orderModel order;
  orderDetails_Info({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(text: order.ownerName);
    TextEditingController fromCountry =
        TextEditingController(text: order.fromGov);
    TextEditingController fromCity =
        TextEditingController(text: order.fromCity);
    TextEditingController toCountry = TextEditingController(text: order.toGov);
    TextEditingController toCity = TextEditingController(text: order.toCity);
    TextEditingController productName =
        TextEditingController(text: order.productName);
    TextEditingController productPrice =
        TextEditingController(text: order.productPrice);
    TextEditingController productWeight =
        TextEditingController(text: order.productWeight);
    TextEditingController rewardAmount =
        TextEditingController(text: order.rewardAmount);
    TextEditingController arrivleDate =
        TextEditingController(text: order.arrivalDate);
    TextEditingController orderID = TextEditingController(text: order.orderID);
    return DefaultTextStyle(
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      child: Column(
        children: [
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Owner Image :"),
                const SizedBox(height: 5),
                Image.network(order.ownerImage, width: 150, height: 150),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.orderType == "shipment"
                    ? "Order Image :"
                    : "Ticket Image :"),
                const SizedBox(height: 5),
                Image.network(order.productImage, width: 150, height: 150),
              ],
            )
          ]),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  DetailsTextField(lable: "Name", txtCont: name),
                  DetailsTextField(lable: "Form Country", txtCont: fromCountry),
                  DetailsTextField(lable: "From City", txtCont: fromCity),
                  DetailsTextField(lable: "To Country", txtCont: toCountry),
                  DetailsTextField(lable: "To City", txtCont: toCity),
                ],
              ),
              const SizedBox(width: 20),
              order.orderType == "shipment"
                  ? Column(
                      children: [
                        DetailsTextField(
                            lable: "Product Name", txtCont: productName),
                        DetailsTextField(
                            lable: "Product Price", txtCont: productPrice),
                        DetailsTextField(
                            lable: "Product Weight", txtCont: productWeight),
                        DetailsTextField(
                            lable: "Reward Amount", txtCont: rewardAmount),
                        DetailsTextField(lable: "orderID", txtCont: orderID),
                      ],
                    )
                  : DetailsTextField(
                      lable: "Arrivle Date", txtCont: arrivleDate),
            ],
          ),
          const SizedBox(height: 10),
          BTN(
              lable: "update",
              press: () async {
                await FirebaseFirestore.instance
                    .collection('orders')
                    .doc(order.orderID)
                    .update({
                  "ownerName": name.text,
                  "fromGov": fromCountry.text,
                  "fromCity": fromCity.text,
                  "toGov": toCountry.text,
                  "toCity": toCity.text,
                  "productName": productName.text,
                  "productPrice": productPrice.text,
                  "productWeight": productWeight.text,
                  "rewardAmount": rewardAmount.text,
                  "arrivleDate": arrivleDate.text,
                  // "userId": controller.text,
                });

                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
