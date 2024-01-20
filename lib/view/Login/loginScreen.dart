import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CollectionReference Admins = FirebaseFirestore.instance.collection("Admins");

  List<AdminModel> adminsList = [];

  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Admins.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              adminsList.add(AdminModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              body: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child:
                            Image.asset('assets/Logo.jpg', fit: BoxFit.cover)),
                    const Text('Login',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          textField(
                              txtcont: userName,
                              label: "User Name",
                              icon: const Icon(Icons.email),
                              isPas: false),
                          const SizedBox(height: 10),
                          textField(
                              txtcont: password,
                              label: "Password",
                              icon: const Icon(Icons.password),
                              isPas: true),
                          const SizedBox(height: 20),
                          MaterialButton(
                              onPressed: () {
                                for (int x = 0; x < adminsList.length; x++) {
                                  if (userName.text == adminsList[x].email &&
                                      password.text == adminsList[x].password) {
                                    Provider.of<myProvider>(context,
                                            listen: false)
                                        .loggedAdmin = adminsList[x];
                                    Navigator.pushReplacementNamed(
                                        context, Home.id);
                                    break;
                                  } else {

                                  }
                                }
                              },
                              minWidth: 150,
                              height: 70,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class textField extends StatelessWidget {
  textField({
    super.key,
    required this.label,
    required this.icon,
    required this.isPas,
    required this.txtcont,
  });
  final String label;
  final Widget icon;
  bool isPas;
  final TextEditingController txtcont;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtcont,
      obscureText: isPas,
      decoration: InputDecoration(
          label: Text(label),
          prefixIcon: icon,
          // suffixIcon: isPas
          //     ? IconButton(
          //         icon: Icon(isPas ? Icons.visibility_off : Icons.visibility),
          //         onPressed: () {
          //           isPas = !isPas;
          //         },
          //       )
          //     : null,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
