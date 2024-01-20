import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/view/home/ManageUser/UserDetalis/UserFileds.dart';
import 'package:dashbord/view/home/ManageUser/UserDetalis/UserRating.dart';
import 'package:dashbord/view/Shared/BTN.dart';
import 'package:dashbord/view/home/ManageUser/UserDetalis/userImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/myProvider.dart';
import '../../../../model/userModel.dart';

class UserDetails_Info extends StatelessWidget {
  UserDetails_Info({
    super.key,
    required this.user,
  });
  final userModel user;

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
                  userImage(imgURL: user.imageUrl),
                  const SizedBox(height: 10),
                  userRating(Rating: user.rate),
                  UserDetailsFileds(userdata: user),
                ],
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: StreamBuilder(
                stream: validation
                    .where('userId', isEqualTo: user.userID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.accountType == "shopper"
                            ? "Front ID :"
                            : "National ID :"),
                        Container(
                          width: imgWidth,
                          height: imgHieght,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                              snapshot.data!.docs[0]['imageURL']['IDFace'],
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 20),
                        Text(user.accountType == "shopper"
                            ? "Back ID :"
                            : "Passport :"),
                        Container(
                          width: imgWidth,
                          height: imgHieght,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                              user.accountType == "shopper"
                                  ? snapshot.data!.docs[0]['imageURL']['IDBack']
                                  : snapshot.data!.docs[0]['imageURL']
                                          ['Passport'] ??
                                      "",
                              fit: BoxFit.cover),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BTN(
            lable: "update",
            press: () async {
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(user.userID)
                  .update({
                "name": UserDetailsFileds.name!.text,
                "mobileNumber": UserDetailsFileds.phone!.text,
                "email": UserDetailsFileds.email!.text,
                "accountType": UserDetailsFileds.userType!.text,
                "validationStatus": UserDetailsFileds.validationStatus!.text,
                "accountStatus": UserDetailsFileds.accountStatus!.text,
                "userId": UserDetailsFileds.userID!.text,
                // "userId": controller.text,
              });

              Navigator.pop(context);
            })
      ],
    );
  }
}
