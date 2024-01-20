import 'package:dashbord/view/Shared/Headers_Of_Tables.dart';
import 'package:flutter/material.dart';

import 'Components/userTable.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Manage User')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Headers_Of_Tables(
                    Lables: [
                      Text('Image'),
                      Text('Name'),
                      Text('Type'),
                      Text('Validation Status'),
                      Text('Action'),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                usersTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
