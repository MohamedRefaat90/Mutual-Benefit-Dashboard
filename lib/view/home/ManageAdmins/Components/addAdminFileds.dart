import 'package:flutter/material.dart';

class addAdminField extends StatelessWidget {
  addAdminField({
    super.key,
    required this.lable,
    required this.txtCont,
  });
  final String lable;

  TextEditingController txtCont;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(lable, style: const TextStyle(fontSize: 13)),
          TextFormField(
            controller: txtCont,
            onChanged: (value) {
              txtCont.text = value;
            },
            decoration: InputDecoration(
              label: Text(lable),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
