  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'BTN.dart';

IconButton DeleteElement(
      BuildContext context, String lable, String elementID, String Collection) {
    return IconButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Delete $lable"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Are You Sure to Delete This $lable ?',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BTN(
                                  lable: "No",
                                  color: Colors.red,
                                  press: () {
                                    Navigator.of(context).pop();
                                  }),
                              BTN(
                                lable: "Yes",
                                press: () async {
                                  await FirebaseFirestore.instance
                                      .collection(Collection)
                                      .doc(elementID)
                                      .delete();
                                  await FirebaseFirestore.instance
                                      .collection(Collection == "Users" ? "Validation" : Collection)
                                      .doc(elementID)
                                      .delete();

                                  Navigator.pop(context);
                                },
                              )
                            ])
                      ],
                    ),
                  ));
        },
        icon: const Icon(Icons.delete, color: Colors.red));
  }