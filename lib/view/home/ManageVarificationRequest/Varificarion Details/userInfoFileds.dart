import 'package:dashbord/view/home/ManageUser/UserDetalis/UserFileds.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/userModel.dart';
import '../../../Shared/detailsTextField.dart';

class userInfoFileds extends StatelessWidget {
  const userInfoFileds({
    super.key,
    required this.userInfo,
    required this.requsetDate,
  });

  final userModel? userInfo;
  final String requsetDate;

  @override
  Widget build(BuildContext context) {
    TextEditingController varificationRequestDate = TextEditingController(
        text: DateFormat.yMd().add_jm().format(DateTime.parse(requsetDate)));
    return Column(
      children: [
        DetailsTextField(lable: "Name", txtCont: UserDetailsFileds.name!),
        DetailsTextField(lable: "Email", txtCont: UserDetailsFileds.email!),
        DetailsTextField(lable: "Phone", txtCont: UserDetailsFileds.phone!),
        DetailsTextField(
            lable: "User Type", txtCont: UserDetailsFileds.userType!),
        DetailsTextField(lable: "Date", txtCont: varificationRequestDate),
      ],
    );
  }
}
