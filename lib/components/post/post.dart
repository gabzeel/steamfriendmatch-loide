import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post({this.user, this.userHandle, this.text, this.createdAt});

  final String user;
  final String userHandle;
  final String text;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(21, 32, 43, 1.0),
          border: Border(bottom: BorderSide())),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Text(user.substring(0, 1)),
          ),
          _postContent()
        ],
      ),
    );
  }

  Widget _postContent() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(user,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(userHandle + " · " + createdAt.toString(),
                      style: TextStyle(color: Colors.grey[400])),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text, style: TextStyle(color: Colors.white))),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
      ),
    );
  }
}
