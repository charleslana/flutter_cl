import 'package:flutter/material.dart';

class Credential extends ChangeNotifier {
  Credential({
    this.email = '',
    this.password = '',
  });

  String email;
  String password;

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  @override
  String toString() {
    return 'Credential(email: $email, password: $password)';
  }
}
