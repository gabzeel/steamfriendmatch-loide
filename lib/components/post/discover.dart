import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/post/controller.dart';
import 'post.dart';

class Discover extends StatefulWidget {
  Discover({Key key}) : super(key: key);
  @override
  _DiscoverState createState() => new _DiscoverState();
}

class _DiscoverState extends StateMVC<Discover> {
  final _con = DiscoverController.con;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 10),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[700], width: 2),
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Post(
              user: "Rhuan",
              userHandle: "@pradoc12",
              text: "Oliveira",
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_comment),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupPost(context));
        },
      ),
    );
  }

  Widget _buildPopupPost(BuildContext context) {
    return new AlertDialog(
      title: const Text('Criar Post'),
      content: new Container(
        child: TextFormField(
          minLines:
              6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) => {
            this._con.changeContent(value)
          },
        ),
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        ),
        new TextButton(
          onPressed: () => {
            this._con.createPost(() {
              Navigator.of(context).pop();
            })
          },
          child: const Text("Post"),
        ),
      ],
    );
  }
}
