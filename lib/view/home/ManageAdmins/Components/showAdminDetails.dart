import 'package:dashbord/model/adminModel.dart';
import 'package:flutter/material.dart';

import '../../../Shared/detailsHeader.dart';
import 'AdminDetails_Info.dart';
import 'AdminsDetails_Header.dart';

Future<dynamic> showAdminDetails(BuildContext context, AdminModel adminData) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title:
                AdminsDetails_Header(lable: "Admin Details", admin: adminData),
            content: SingleChildScrollView(
              child: AdminDetails_Info(admin: adminData),
            ),
          ));
}
