import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/right_drawer/controller.dart';

import '../camera_image_preview.dart';

class RightDrawer extends StatefulWidget {
  final VoidCallback onLogout;
  RightDrawer({Key key, this.onLogout});
  @override
  _RightDrawerState createState() => new _RightDrawerState();
}

class _RightDrawerState extends StateMVC<RightDrawer> {
  final RightDrawerController _con = RightDrawerController.con;

  @override
  void initState() {
    super.initState();
  }

  pushCameraImagePreview(BuildContext context, CameraController cameraController) {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraImagePreview(
          imageController: cameraController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                  child: GestureDetector(
                onTap: () async {
                  await _con.initializeCamera();
                  pushCameraImagePreview(context, _con.camera);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // backgroundImage: NetworkImage(imagem),
                  radius: 60.0,
                  child: Text(
                    "Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              )),
            ),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/settings',
              );
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
