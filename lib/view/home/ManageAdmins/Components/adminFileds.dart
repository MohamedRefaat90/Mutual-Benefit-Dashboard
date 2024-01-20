import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:dashbord/view/Shared/detailsTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDetailsFileds extends StatelessWidget {
  const AdminDetailsFileds({
    super.key,
    required this.admindata,
  });
  final AdminModel admindata;
  static TextEditingController? name;
  static TextEditingController? image;
  static TextEditingController? email;
  static TextEditingController? password;
  static TextEditingController? type;
  static TextEditingController? phone;
  static TextEditingController? adminID;
  @override
  Widget build(BuildContext context) {
    myProvider controller = Provider.of(context);
    name = TextEditingController(text: admindata.name);

    phone = TextEditingController(text: admindata.phone);

    email = TextEditingController(text: admindata.email);

    password = TextEditingController(text: admindata.password);

    type = TextEditingController(text: admindata.type);

    adminID = TextEditingController(text: admindata.id);

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      child: Column(
        children: [
          Row(
            children: [
              DetailsTextField(lable: 'Name', txtCont: name!),
              const SizedBox(width: 20),
              DetailsTextField(lable: 'Phone', txtCont: phone!),
            ],
          ),
          Row(
            children: [
              DetailsTextField(lable: 'Email', txtCont: email!),
              const SizedBox(width: 20),
              DetailsTextField(
                  lable: 'password',
                  txtCont: password!,
                  isSuperAdmin: admindata.type == "super Admin" ? true : false),
            ],
          ),
          Row(
            children: [
              DetailsTextField(lable: 'Status', txtCont: type!),
              const SizedBox(width: 20),
              DetailsTextField(lable: 'Admin ID', txtCont: adminID!),
            ],
          ),
        ],
      ),
    );
  }
}
