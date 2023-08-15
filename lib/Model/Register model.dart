import 'package:flutter/material.dart';
class Register extends ChangeNotifier {
  String name;
  String email;
  String password;


  Register(
      {required this.name,required this.email,required this.password });

  factory Register.fromJson(Map _map) {
    Register _user = Register(
        name: _map["name"],
        password: _map["password"],
        email: _map["email"],
    );
    return _user;
  }
}