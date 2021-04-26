import 'package:flutter/material.dart';

class ChatListPreview extends StatelessWidget {
  final String _username;
  final String _lastMessage;

  ChatListPreview({Key key, String username, String lastMessage})
      : this._lastMessage = lastMessage,
        this._username = username;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(size: 32),
        title: Text(
          _username,
        ),
        subtitle: Text(
          _lastMessage,
        ),
        trailing: Icon(Icons.delete),
        onTap: () {

        },
      ),
    );
  }
}
