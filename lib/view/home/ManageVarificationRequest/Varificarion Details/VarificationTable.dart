import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/model/VarificationRequsetModel.dart';
import 'package:dashbord/view/home/ManageUser/Components/userTable.dart';
import 'package:dashbord/view/home/ManageVarificationRequest/Varificarion%20Details/showValidationDetails.dart';
import 'package:flutter/material.dart';

import '../../../Shared/LoadingWidget.dart';
import '../../../Shared/deleteElement.dart';

class VarificationTable extends StatelessWidget {
  VarificationTable({
    super.key,
  });
  static List<VarificationRequsetModel>? varificationRequsetsList;
  @override
  Widget build(BuildContext context) {
    CollectionReference varificationRequsetsData =
        FirebaseFirestore.instance.collection('Validation');
    varificationRequsetsList = [];

    return StreamBuilder(
        stream: varificationRequsetsData.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              varificationRequsetsList!.add(
                  VarificationRequsetModel.fromJson(snapshot.data!.docs[i]));
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.blue[400],
                      onPressed: () {
                        showValidationDetails(
                            context, varificationRequsetsList![index], index);
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
                                  Text(varificationRequsetsList![index].userID ==
                                          usersTable.usersList![index].userID
                                      ? usersTable.usersList![index].name
                                      : ""),
                                  const SizedBox(width: 90),
                                  Text(varificationRequsetsList![index].userID),
                                  const SizedBox(width: 100),
                                  Text(varificationRequsetsList![index]
                                      .accountType),
                                  const SizedBox(width: 200),
                                  Text(usersTable
                                      .usersList![index].validationStatus),
                                  const SizedBox(width: 230),
                                  Row(
                                    children: [
                                      DeleteElement(
                                          context,
                                          "Varification Request",
                                          varificationRequsetsList![index]
                                              .userID,
                                          "Validation"),
                                    ],
                                  )
                                ])),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                itemCount: varificationRequsetsList!.length);
          } else {
            return const LoadingWidget();
          }
        });
  }
}
