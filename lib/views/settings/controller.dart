import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ControllerMVC {
  factory SettingsController() {
    if (_this == null) _this = new SettingsController._();
    return _this;
  }

  static SettingsController _this = new SettingsController._();

  SettingsController._();

  String _username = "";
  void changeUsername(String newUsername) => _username = newUsername;

  static SettingsController get con => _this;

  Future<void> updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtToken = prefs.get("tokenjwt").toString();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken);

    final String userId = decodedToken['user']['id'];

    var header = {"Content-Type": "application/json"};

    Map params = {"name": _username};

    var _body = json.encode(params);
    var response = await http.put("http://10.0.2.2:3000/users/" + userId,
        headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      await prefs.setString("username", mapResponse["name"]);
    } else {
      return;
    }
  }
}
