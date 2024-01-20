import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:flutter/material.dart';
import '../../../Shared/LoadingWidget.dart';
import 'showAdminDetails.dart';

class adminsTable extends StatelessWidget {
  adminsTable({
    super.key,
  });
  CollectionReference adminsData =
      FirebaseFirestore.instance.collection('Admins');
  @override
  Widget build(BuildContext context) {
    List<AdminModel> adminsList = [];
    return FutureBuilder(
        future: adminsData.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              adminsList.add(AdminModel.fromJson(snapshot.data!.docs[i]));
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.blue[400],
                      onPressed: () {
                        showAdminDetails(context, adminsList[index]);
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
                                          adminsList[index].image,
                                          fit: BoxFit.cover)),
                                  const SizedBox(width: 240),
                                  Text(adminsList[index].name),
                                  const SizedBox(width: 230),
                                  Text(adminsList[index].type),
                                  const SizedBox(width: 270),
                                  Text(
                                    adminsList[index].state,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            adminsList[index].state == "Online"
                                                ? Colors.green
                                                : Colors.red),
                                  ),
                                ])),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                itemCount: adminsList.length);
          } else {
            return const LoadingWidget();
          }
        });
  }
}
