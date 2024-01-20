import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/model/VarificationRequsetModel.dart';
import 'package:dashbord/model/userModel.dart';
import 'package:dashbord/view/home/ManageUser/Components/userTable.dart';
import 'package:dashbord/view/home/ManageVarificationRequest/Varificarion%20Details/userImages.dart';
import 'package:dashbord/view/home/ManageVarificationRequest/Varificarion%20Details/userInfoFileds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Shared/BTN.dart';

class VarificationDetails_Info extends StatefulWidget {
  const VarificationDetails_Info(
      {super.key, required this.varificationRequset, required this.userIndex});

  final VarificationRequsetModel varificationRequset;
  final int userIndex;
  @override
  State<VarificationDetails_Info> createState() =>
      _VarificationDetails_InfoState();
}

class _VarificationDetails_InfoState extends State<VarificationDetails_Info> {
  @override
  Widget build(BuildContext context) {
    // myProvider controller = Provider.of(context, listen: false);
    // get User that Match VarificationRequset
    userModel? userInfo = widget.varificationRequset.userID ==
            usersTable.usersList![widget.userIndex].userID
        ? usersTable.usersList![widget.userIndex]
        : null;

    return DefaultTextStyle(
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      child: Column(
        children: [
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("User Image :"),
                const SizedBox(height: 5),
                Image.network(userInfo!.imageUrl, width: 150, height: 150),
              ],
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userInfoFileds(userInfo: userInfo ,requsetDate: widget.varificationRequset.date),
              const SizedBox(width: 20),
              userImages(varificationRequset: widget.varificationRequset)
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BTN(
                  lable: 'Accept',
                  press: () async {
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(userInfo.userID)
                        .update({"validationStatus": "accepted"});

                    Navigator.pop(context);
                    // print("========================");
                    // print(controller.varificationRequsetsList);
                    // print(controller.usersList);
                    // print("========================");
                    // controller.update();
                  }),
              const SizedBox(width: 30),
              BTN(
                  lable: "Reject",
                  press: () async {
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(userInfo.userID)
                        .update({"validationStatus": "rejected"});

                    Navigator.pop(context);
                    // controller.update();

                  },
                  color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
