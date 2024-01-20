import 'package:dashbord/view/Shared/deleteElement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/myProvider.dart';
import '../../../../model/adminModel.dart';
import '../../../Shared/details_IconBtn.dart';

class AdminsDetails_Header extends StatelessWidget {
  const AdminsDetails_Header({
    super.key,
    required this.lable,
    required this.admin,
  });
  final AdminModel admin;
  final String lable;
  @override
  Widget build(BuildContext context) {
    myProvider controller = Provider.of<myProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lable, style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            controller.loggedAdmin.type == "super Admin"
                ? Row(
                    children: [
                      Details_IconBtn(
                        icon: Icon(controller.isReadonly == true
                            ? Icons.edit
                            : Icons.edit_off),
                        color: Colors.green,
                        press: () {
                          controller.editFileds();
                        },
                      ),
                      
                      DeleteElement(context, lable, admin.id, "Admins")
                      
                    ],
                  )
                : Container(),
            Details_IconBtn(
              icon: const Icon(Icons.close),
              color: Colors.blue,
              press: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}
