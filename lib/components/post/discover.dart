import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/post/controller.dart';
import 'package:streamfriendmatch/model/PostModel.dart';
import 'post.dart';

class Discover extends StatefulWidget {
  Discover({Key key}) : super(key: key);
  @override
  _DiscoverState createState() => new _DiscoverState();
}

class _DiscoverState extends StateMVC<Discover> {
  final _con = DiscoverController.con;
  Future<List<PostModel>> _posts;

  void initState() {
    super.initState();
    _posts = DiscoverController.getPosts();
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
            FutureBuilder(
              future: _posts,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PostModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Text('Nothing to show');
                }

                return Center(
                  child: Container(
                    child: Column(
                        children: snapshot.data
                            .map(
                              (post) => new Post(
                                createdAt: post.createdAt,
                                user: post.user.name,
                                userHandle: post.user.email,
                                text: post.content.length > 0
                                    ? post.content
                                    : 'Nothing to show',
                              ),
                            )
                            .toList()),
                  ),
                );
              },
            ),
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
          minLines: 6,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) => {this._con.changeContent(value)},
        ),
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {});
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
