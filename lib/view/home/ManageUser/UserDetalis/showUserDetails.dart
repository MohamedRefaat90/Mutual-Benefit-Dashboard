import 'package:dashbord/model/userModel.dart';
import 'package:flutter/material.dart';

import '../../../Shared/detailsHeader.dart';
import 'UserDetails_Info.dart';

Future<dynamic> showUserDetails(BuildContext context, userModel userData) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Details_Header(lable: "User Details"),
            content: SingleChildScrollView(
              child: UserDetails_Info(user: userData),
            ),
          ));
}
