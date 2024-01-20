import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/Controller/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/userModel.dart';
import '../../../Shared/LoadingWidget.dart';
import '../../../Shared/deleteElement.dart';
import '../UserDetalis/showUserDetails.dart';

class usersTable extends StatelessWidget {
  usersTable({
    super.key,
  });
  static List<userModel>? usersList = [];
  CollectionReference usersData =
      FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    usersList = [];
    return FutureBuilder(
        future: usersData.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              usersList!.add(userModel.fromJson(snapshot.data!.docs[i]));
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.blue[400],
                      onPressed: () {
                        showUserDetails(context, usersList![index]);
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.network(
                                          usersList![index].imageUrl,
                                          fit: BoxFit.cover)),
                                  const SizedBox(width: 150),
                                  Text(usersList![index].name),
                                  const SizedBox(width: 130),
                                  Text(usersList![index].accountType),
                                  const SizedBox(width: 190),
                                  Text(usersList![index].validationStatus),
                                  const SizedBox(width: 230),
                                  DeleteElement(context, "User",
                                      usersList![index].userID, "Users"),
                                ])),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                itemCount: usersList!.length);
          } else {
            return const LoadingWidget();
          }
        });
  }
}
