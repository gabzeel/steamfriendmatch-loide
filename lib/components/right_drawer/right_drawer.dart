import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/right_drawer/controller.dart';
import 'package:streamfriendmatch/views/settings/settings.dart';

import '../camera_image_preview/camera_image_preview.dart';

class RightDrawer extends StatefulWidget {
  final VoidCallback onLogout;
  RightDrawer({Key key, this.onLogout});
  @override
  _RightDrawerState createState() => new _RightDrawerState();
}

class _RightDrawerState extends StateMVC<RightDrawer> {
  final RightDrawerController _con = RightDrawerController.con;
  Future<String> profileUrl;
  Future<String> profileUsername;

  @override
  void initState() {
    super.initState();
    this.profileUrl = RightDrawerController.getProfilePhotoUrl();
    this.profileUsername = RightDrawerController.getProfileUsername();
  }

  pushCameraImagePreview(
      BuildContext context, CameraController cameraController) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraImagePreview(
          imageController: cameraController,
        ),
      ),
    ).then((value) {
      setState(() {
        this.profileUrl = RightDrawerController.getProfilePhotoUrl();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    this.profileUrl = RightDrawerController.getProfilePhotoUrl();
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        await _con.initializeCamera();
                        pushCameraImagePreview(context, _con.camera);
                      },
                      child: FutureBuilder(
                        future: profileUrl,
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          ImageProvider<Object> backgroundImage;
                          Text text;
                          if (snapshot.hasData) {
                            backgroundImage = NetworkImage(snapshot.data);
                            text = null;
                          } else {
                            backgroundImage = null;
                            text = null;
                            text = Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            );
                          }

                          return CircleAvatar(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            backgroundImage: backgroundImage,
                            radius: 60.0,
                            child: text,
                          );
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: this.profileUsername,
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data);
                        }

                        return Text("Sem nome");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              ).then((value) {
                setState(() {
                  this.profileUsername = RightDrawerController.getProfileUsername();
                });
              });
            },
          ),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              widget.onLogout();
            },
          ),
        ],
      ),
    );
  }
}
