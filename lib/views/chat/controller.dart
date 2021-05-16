import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:streamfriendmatch/model/UserModel.dart';

class ChatController extends ControllerMVC {
  factory ChatController() {
    if (_this == null) _this = new ChatController._();
    return _this;
  }
  static ChatController _this = new ChatController._();

  ChatController._();

  static ChatController get con => _this;

  List<UserModel> userList = [];

  void getAllUsers() async {
    var prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.get("tokenjwt").toString();

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Baerer " + jwtToken
    };

    var response =
        await http.get("http://10.0.2.2:3000/users", headers: header);

    List responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      userList =
          responseJson.map((user) => new UserModel.fromJson(user)).toList();
    } else {
      return null;
    }
  }
}
