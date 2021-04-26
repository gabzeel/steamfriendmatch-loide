import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends ControllerMVC {
  factory LoginController() {
    if (_this == null) _this = new LoginController._();
    return _this;
  }

  static LoginController _this = new LoginController._();

  String _email = "";
  void changeEmail(String newEmail) => _email = newEmail;

  String _password = "";
  void changePassword(String newPassword) => _password = newPassword;

  LoginController._();

  static LoginController get con => _this;

  void verifyIfUserIsLogged(Function() onComplete) async {
    var prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.get("tokenjwt").toString();

    if (jwtToken.isNotEmpty) {
      onComplete();
    }
  }

  void getUser(Function() onComplete) async {
    var header = {"Content-Type": "application/json"};

    Map params = {"email": _email, "password": _password};

    var prefs = await SharedPreferences.getInstance();

    var _body = json.encode(params);

    var response = await http.post("http://10.0.2.2:3000/auth/login",
        headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      prefs.setString("tokenjwt", mapResponse["token"]);

      onComplete();
    } else {
      return null;
    }
  }
}
