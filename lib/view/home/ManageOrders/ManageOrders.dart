import 'package:flutter/material.dart';

import '../../Shared/Headers_Of_Tables.dart';
import 'Components/orderTable.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Orders',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:25.0),
                child: Headers_Of_Tables(Lables: [
                  Text('Order ID'),
                  Text('From'),
                  Text('To'),
                  Text('Creation Data'),
                  Text('Type'),
                  Text('Action'),
                ]),
              ),
              Divider(thickness: 2),
              ordersTable()
            ],
          ),
        )),
      ),
    );
  }
}
