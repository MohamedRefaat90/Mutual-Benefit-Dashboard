import 'package:dashbord/model/adminModel.dart';
import 'package:flutter/material.dart';


class myProvider extends ChangeNotifier {
  bool isReadonly = true;

  late AdminModel loggedAdmin;

  var validation;
  editFileds() {
    isReadonly = !isReadonly;
    notifyListeners();
  }
}
