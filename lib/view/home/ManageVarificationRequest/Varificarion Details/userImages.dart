import 'package:flutter/material.dart';

import '../../../../model/VarificationRequsetModel.dart';
import 'VarificationDetails_Info.dart';
import 'id_Imgs.dart';

class userImages extends StatelessWidget {
  const userImages({
    super.key,
    required this.varificationRequset,
  });

  final VarificationRequsetModel varificationRequset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        id_Imgs(
            lable: "  ID Front :", img: varificationRequset.imageURL['IDFace']),
        const SizedBox(height: 10),
        varificationRequset.accountType != 'travelr'
            ? id_Imgs(
                lable: "  ID Back :",
                img: varificationRequset.imageURL['IDBack'])
            : Container(),
        const SizedBox(height: 10),
        varificationRequset.accountType == 'traveler' ||
                varificationRequset.accountType == 'superUser'
            ? id_Imgs(
                lable: "  Passport :",
                img: varificationRequset.imageURL['Passport'])
            : Container()
      ],
    );
  }
}
