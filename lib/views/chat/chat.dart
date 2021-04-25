import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('sdfsdf'),
      ),
    );
  }
}
