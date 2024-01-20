import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/view/Shared/detailsTextField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../model/userModel.dart';

class UserDetailsFileds extends StatelessWidget {
  UserDetailsFileds({
    super.key,
    required this.userdata,
  });
  final userModel userdata;
  static TextEditingController? name;
  static TextEditingController? phone;
  static TextEditingController? email;
  static TextEditingController? userType;
  static TextEditingController? validationStatus;
  static TextEditingController? accountStatus;
  static TextEditingController? userID;
  @override
  Widget build(BuildContext context) {
    myProvider controller = Provider.of(context);
    name = TextEditingController(text: userdata.name);

    phone = TextEditingController(text: userdata.mobileNumber);

    email = TextEditingController(text: userdata.email);

    userType = TextEditingController(text: userdata.accountType);

    validationStatus = TextEditingController(text: userdata.validationStatus);

    accountStatus = TextEditingController(text: userdata.accountStatus);

    userID = TextEditingController(text: userdata.userID);

    TextEditingController regestrationDate = TextEditingController(
        text: DateFormat.yMd().format(DateTime.parse(userdata.date)));
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
              DetailsTextField(lable: 'User Type', txtCont: userType!),
            ],
          ),
          Row(
            children: [
              DetailsTextField(
                  lable: 'Validation Status', txtCont: validationStatus!),
              const SizedBox(width: 20),
              DetailsTextField(
                  lable: 'Account Status', txtCont: accountStatus!),
            ],
          ),
          Row(
            children: [
              DetailsTextField(lable: 'User ID', txtCont: userID!),
              const SizedBox(width: 20),
              DetailsTextField(
                  lable: 'Regestration Date', txtCont: regestrationDate),
            ],
          ),
        ],
      ),
    );
  }
}
