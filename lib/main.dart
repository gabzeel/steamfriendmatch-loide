import 'package:flutter/material.dart';
import 'package:streamfriendmatch/views/chat.dart';
import 'package:streamfriendmatch/views/home.dart';
import 'package:streamfriendmatch/views/login.dart';
import 'package:streamfriendmatch/views/register.dart';
import 'package:streamfriendmatch/views/settings.dart';

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
