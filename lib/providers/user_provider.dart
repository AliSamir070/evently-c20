import 'package:evently_c20/core/remote/network/firestore_manager.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserProvider  extends ChangeNotifier{

  User? user;

  setUserValue()async{
    user = await FirestoreManager.getUser();
    notifyListeners();
  }
}