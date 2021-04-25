import 'package:flutter/material.dart';
import 'package:streamfriendmatch/views/chat/chat.dart';
import 'package:streamfriendmatch/views/home/home.dart';
import 'package:streamfriendmatch/views/login/login.dart';
import 'package:streamfriendmatch/views/register/register.dart';
import 'package:streamfriendmatch/views/settings/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam Friend Match',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (_) => Login(),
        "/home": (_) => Home(),
        "/register": (_) => Register(),
        "/settings": (_) => Settings(),
        "/chat": (_) => Chat(),
      },
    );
  }
}
