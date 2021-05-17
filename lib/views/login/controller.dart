import 'package:jwt_decoder/jwt_decoder.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtToken = prefs.get("tokenjwt").toString();

    if (jwtToken.toString() != 'null') {
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
      Map<String, dynamic> decodedToken = JwtDecoder.decode(mapResponse["token"]);
      prefs.setString("tokenjwt", mapResponse["token"]);
      prefs.setString("photoKey", decodedToken['user']['photoKey']);
      prefs.setString("username", decodedToken['user']['name']);
      onComplete();
    } else {
      return;
    }
  }
}
