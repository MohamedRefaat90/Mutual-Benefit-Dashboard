import 'package:dashbord/Controller/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsTextField extends StatelessWidget {
  DetailsTextField({
    super.key,
    required this.lable,
    required this.txtCont,
    this.isSuperAdmin,
  });
  final String lable;
  bool? isSuperAdmin;

  TextEditingController txtCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool readOnly = Provider.of<myProvider>(context).isReadonly;
    return SizedBox(
      width: 230,
      child: Provider<myProvider>(
        create: (context) => myProvider(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lable, style: const TextStyle(fontSize: 13)),
            TextFormField(
              controller: txtCont,
              obscureText: isSuperAdmin ?? false,
              onChanged: (value) {
                txtCont.text = value;
              },
              readOnly: readOnly,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: readOnly ? Colors.grey : Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
