import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:dashbord/view/Shared/BTN.dart';
import 'package:dashbord/view/home/ManageUser/UserDetalis/userImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/myProvider.dart';
import 'adminFileds.dart';

class AdminDetails_Info extends StatelessWidget {
  AdminDetails_Info({
    super.key,
    required this.admin,
  });
  final AdminModel admin;

  CollectionReference validation =
      FirebaseFirestore.instance.collection('Validation');
  double imgWidth = 300;
  double imgHieght = 150;
  @override
  Widget build(BuildContext context) {
    myProvider controller = Provider.of(context);
    return Column(
      children: [
        Row(
          children: [
            DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.bold),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userImage(imgURL: admin.image),
                  const SizedBox(height: 10),
                  AdminDetailsFileds(admindata: admin),
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
        controller.loggedAdmin.type == "super Admin"
            ? BTN(
                lable: "update",
                press: () async {
                  await FirebaseFirestore.instance
                      .collection('Admins')
                      .doc(admin.id)
                      .update({
                    "name": AdminDetailsFileds.name!.text,
                    "number": AdminDetailsFileds.phone!.text,
                    "email": AdminDetailsFileds.email!.text,
                    "type": AdminDetailsFileds.type!.text,
                    "id": AdminDetailsFileds.adminID!.text,
                    // "userId": controller.text,
                  });

                  Navigator.pop(context);
                })
            : Container()
      ],
    );
  }
}
