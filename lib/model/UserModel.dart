import 'package:flutter/material.dart';

class UserModel {
  double _id;
  String _email;
  String _name;
  String _password;

  double get id => _id;
  String get email => _email;
  String get name => _name;

  void setter(id, email, name, password) {
    this._id = id;
    this._email = email;
    this._name = name;
    this._password = password;
  }
}
