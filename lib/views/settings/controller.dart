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
    // var header = {"Content-Type": "application/json"};

    // Map params = {"email": username, "password": _password};

    // var prefs = await SharedPreferences.getInstance();

    // var _body = json.encode(params);

    // var response = await http.post("http://10.0.2.2:3000/auth/login",
    //     headers: header, body: _body);

    // Map mapResponse = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   Map<String, dynamic> decodedToken = JwtDecoder.decode(mapResponse["token"]);
    //   prefs.setString("tokenjwt", mapResponse["token"]);
    //   prefs.setString("photoKey", decodedToken['user']['photoKey']);
    // } else {
    //   return;
    // }
  }
}
