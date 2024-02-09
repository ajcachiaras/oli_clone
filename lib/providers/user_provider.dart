import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // shared data goes here
  String userName;

  UserProvider({
    this.userName = "User 1",
  });

  void changeUserName({required String newUserName,}) async {
    userName = newUserName;
    notifyListeners();
  }
}

