import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController extends ControllerMVC {
  factory PostController() {
    if (_this = null) _this = new PostController()._();
    return _this;
  }

  static PostController _this = new PostController()._();

  String _content = "";
  void changeContent(String content) => _content = content;

  static PostController get con => _this;

  void createPost(Function() onClomplete) async {
    var header = {"Content-Type": "application/json"};

    Map params = {
      "content": _content,
    };

    var prefs = await SharedPreferences.getInstance();

    var _body = json.encode(params);

    var response = await http.post("http://10.0.2.2:3000/posts",
        headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      onClomplete();
    } else {
      return null;
    }
  }
}
