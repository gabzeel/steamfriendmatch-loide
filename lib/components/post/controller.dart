import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiscoverController extends ControllerMVC {
  factory DiscoverController(BuildContext context) {
    if (_this == null) _this = new DiscoverController._();
    return _this;
  }

  static DiscoverController _this = new DiscoverController._();

  DiscoverController._();

  static DiscoverController get con => _this;

  String _content = "";
  void changeContent(String content) => _content = content;

  void createPost(Function() onClomplete) async {
    var header = {"Content-Type": "application/json"};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtToken = prefs.get("tokenjwt").toString();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken);

    final String userId = decodedToken['user']['id'];

    Map params = {
      "content": _content,
      "userId": userId
    };

    var _body = json.encode(params);

    print(params);
    var response = await http.post("http://10.0.2.2:3000/posts",
        headers: header, body: _body);

    // Map mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      onClomplete();
    } else {
      return null;
    }
  }
}