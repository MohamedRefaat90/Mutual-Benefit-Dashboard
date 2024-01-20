import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/model/adminModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class welcomeAdmin extends StatelessWidget {
  welcomeAdmin({
    super.key,
  });
  String admin = "Mohamed Refaat";
  @override
  Widget build(BuildContext context) {
    AdminModel admin =
        Provider.of<myProvider>(context, listen: false).loggedAdmin;
    double size = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Admin : ",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                admin.name,
                style: const TextStyle(
                    color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.network(admin.image, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
