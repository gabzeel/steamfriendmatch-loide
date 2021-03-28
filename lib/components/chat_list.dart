import 'package:flutter/material.dart';
import 'package:streamfriendmatch/components/chat_list_preview.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
          children: <Widget>[
            ChatListPreview(
              username: 'Gabriel',
              lastMessage: 'Oi Gabriel?',
            ),
            ChatListPreview(
              username: 'Rhuan',
              lastMessage: 'Oi Rhuan?',
            ),
            ChatListPreview(
              username: 'João',
              lastMessage: 'Oi João?',
            ),
          ],
        ),
      ),
    );
  }
}
