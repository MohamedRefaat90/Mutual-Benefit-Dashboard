import 'package:flutter/material.dart';

import '../../Shared/Headers_Of_Tables.dart';
import 'Varificarion Details/VarificationTable.dart';

class ManageVarificationRequest extends StatelessWidget {
  const ManageVarificationRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Manage Varification Requsets'),
          ),
          body: Column(
            children:  [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:25.0),
                child: Headers_Of_Tables(Lables: [
                  Text('Name'),
                  Text('userID'),
                  Text('Type'),
                  Text('Validation'),
                  Text('Action'),
                ]),
              ),
              const Divider(thickness: 2),
              VarificationTable()
            ],
          ),
        ));
  }
}
