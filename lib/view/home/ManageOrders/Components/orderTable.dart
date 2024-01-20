import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/model/orderModel.dart';
import 'package:flutter/material.dart';
import '../../../Shared/LoadingWidget.dart';
import '../../../Shared/deleteElement.dart';
import '../OrderDetails/showOrderDetails.dart';
import 'package:intl/intl.dart';

class ordersTable extends StatelessWidget {
  const ordersTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference usersData =
        FirebaseFirestore.instance.collection('orders');
    List<orderModel> ordersList = [];
    return FutureBuilder(
        future: usersData.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              ordersList.add(orderModel.fromJson(snapshot.data!.docs[i]));
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.blue[400],
                      onPressed: () {
                        showOrderDetails(context, ordersList[index]);
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(ordersList[index].orderID)),
                                  // const SizedBox(width: 40),
                                  Expanded(flex: 1,child: Text(ordersList[index].fromCity)),
                                  const SizedBox(width: 80),
                                  Text(ordersList[index].toCity),
                                  const SizedBox(width: 80),
                                  Text(DateFormat.yMd().add_jms().format(
                                      DateTime.parse(ordersList[index].date))),
                                  const SizedBox(width: 120),
                                  Text(ordersList[index].orderType),
                                  const SizedBox(width: 100),
                                  Row(
                                    children: [
                                      // IconButton(
                                      //     onPressed: () {
                                      //       controller.editFileds();
                                      //     },
                                      //     icon:  Icon(controller.isReadonly? Icons.visibility_off : Icons.visibility)),
                                      DeleteElement(context, "Order",
                                          ordersList[index].orderID, "orders")
                                    ],
                                  )
                                ])),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                itemCount: ordersList.length);
          } else {
            return const LoadingWidget();
          }
        });
  }
}
