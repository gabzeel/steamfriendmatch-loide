import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/UserModel.dart';

Future<UserModel> getUser(user, password) async {
  UserModel user;
  var userJson;
  var url = "";

  var header = {"Content-Type": "application/json"};

  Map params = {"username": user, "password": password};

  var prefs = await SharedPreferences.getInstance();

  var _body = json.encode(params);

  var response = await http.post(url, headers: header, body: _body);

  Map mapResponse = json.decode(response.body);

  if (response.statusCode == 200) {
    prefs.setString("tokenjwt", mapResponse["token"]);
    return user; //tem que retornar o usuario aqui ainda
  } else {
    return null;
  }
}
