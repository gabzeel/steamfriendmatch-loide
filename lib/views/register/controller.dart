import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends ControllerMVC {
  factory RegisterController() {
    if (_this == null) _this = new RegisterController._();
    return _this;
  }

  static RegisterController _this = new RegisterController._();

  String _email = "";
  void changeEmail(String newEmail) => _email = newEmail;

  String _name = "";
  void changeName(String name) => _name = name;

  String _password = "";
  void changePassword(String newPassword) => _password = newPassword;

  String _repetedPassword = "";
  void changRepetedPassword(String repetedPassword) => _repetedPassword = repetedPassword;

  RegisterController._();

  static RegisterController get con => _this;

  void createNewUser(Function() onComplete) async {
    if (_repetedPassword != _password) {

    }

    var header = {"Content-Type": "application/json"};

    Map params = {"email": _email, "name": _name, "password": _password};

    var prefs = await SharedPreferences.getInstance();

    var _body = json.encode(params);

    var response = await http.post("http://10.0.2.2:3000/users",
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
