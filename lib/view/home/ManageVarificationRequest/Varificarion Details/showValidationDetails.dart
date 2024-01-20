// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dashbord/model/VarificationRequsetModel.dart';
import 'package:flutter/material.dart';

import '../../../Shared/detailsHeader.dart';
import 'VarificationDetails_Info.dart';

Future<dynamic> showValidationDetails(BuildContext context,
    VarificationRequsetModel varificationData, int userIndex) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Details_Header(lable: "Varification Details"),
            content: SingleChildScrollView(
              child: VarificationDetails_Info(
                  varificationRequset: varificationData, userIndex: userIndex),
            ),
          ));
}
