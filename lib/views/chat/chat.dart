import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/chat_list.dart';
import 'package:streamfriendmatch/views/chat/controller.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends StateMVC<Chat> {
  final ChatController _con = ChatController.con;

  @override
    void initState() {
      super.initState();
      _con.getAllUsers();
    }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ChatList(users: _con.userList),
      ),
    );
  }
}
