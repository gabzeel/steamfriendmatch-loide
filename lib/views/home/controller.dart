import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ControllerMVC {
  factory HomeController() {
    if (_this == null) _this = new HomeController._();
    return _this;
  }

  static HomeController _this = new HomeController._();

  HomeController._();

  static HomeController get con => _this;

  void loggout(Function() onCompleted) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    onCompleted();
  }
}
