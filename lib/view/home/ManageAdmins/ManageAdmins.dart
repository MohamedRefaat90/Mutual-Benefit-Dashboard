import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:dashbord/view/Shared/BTN.dart';
import 'package:dashbord/view/Shared/Headers_Of_Tables.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'Components/addAdminFileds.dart';
import 'Components/adminsTable.dart';

class ManageAdmins extends StatelessWidget {
  ManageAdmins({super.key});
  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController type = TextEditingController();

  TextEditingController adminID = TextEditingController();
  var getImg;

  Future<String?> selectPicture() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1000,
      maxWidth: 1000,
    );

    return image?.path;
  }

  @override
  Widget build(BuildContext context) {
    AdminModel admin = Provider.of<myProvider>(context).loggedAdmin;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Admins'),
          actions: [
            admin.type == "super Admin"
                ? IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: const Text("Add Admin"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      addAdminField(
                                          lable: 'Name', txtCont: name),
                                      const SizedBox(width: 20),
                                      addAdminField(
                                          lable: 'Phone', txtCont: phone),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      addAdminField(
                                          lable: 'Email', txtCont: email),
                                      const SizedBox(width: 20),
                                      addAdminField(
                                        lable: 'password',
                                        txtCont: password,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      addAdminField(
                                          lable: 'Type', txtCont: type),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      final storage = FirebaseStorage.instance;
                                      String? path = await selectPicture();
                                      var imgName = basename(path!);
                                      Uint8List imageData =
                                          await XFile(path).readAsBytes();

                                      UploadTask uploadTask = storage
                                          .ref("AdminImage/$imgName.png")
                                          .putData(imageData);
                                    },
                                    minWidth: 400,
                                    color: Colors.purple,
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text("Upload Image"),
                                  ),
                                  const SizedBox(height: 20),
                                  BTN(
                                      lable: "Submit",
                                      press: () async {
                                        FirebaseFirestore.instance
                                            .collection('Admins')
                                            .doc()
                                            .set({
                                          "name": name.text,
                                          "email": email.text,
                                          "number": phone.text,
                                          "password": password.text,
                                          "type": type.text,
                                        });
                                      })
                                ],
                              )));
                    },
                    icon: const Icon(Icons.person_add, size: 25))
                : Container()
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Headers_Of_Tables(
                    Lables: [
                      Text('Image'),
                      Text('Name'),
                      Text('Type'),
                      Text('Status'),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                adminsTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
