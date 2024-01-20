import 'package:dashbord/view/Shared/deleteElement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/myProvider.dart';
import 'details_IconBtn.dart';

class Details_Header extends StatelessWidget {
  const Details_Header({
    super.key,
    required this.lable,
  });
  final String lable;
  @override
  Widget build(BuildContext context) {
    myProvider controller = Provider.of<myProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lable, style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Details_IconBtn(
              icon: Icon(
                  controller.isReadonly == true ? Icons.edit : Icons.edit_off),
              color: Colors.green,
              press: () {
                controller.editFileds();
              },
            ),
            // Details_IconBtn(
            //   icon: const Icon(Icons.delete),
            //   color: Colors.red,
            //   press: () {
            //     DeleteElement(context, lable, elementID, "Users");
            //   },
            // ),
            Details_IconBtn(
              icon: const Icon(Icons.close),
              color: Colors.blue,
              press: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}
