import 'package:flutter/material.dart';
import 'package:streamfriendmatch/components/chat_list_preview.dart';
import 'package:streamfriendmatch/model/UserModel.dart';

class ChatList extends StatelessWidget {
  final List<UserModel> _users;

  ChatList({Key key, List<UserModel> users}) : this._users = users;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
            children: _users
                .map(
                  (user) => new ChatListPreview(
                    username: user.name,
                    lastMessage: 'Last message',
                  ),
                )
                .toList()),
      ),
    );
  }
}
