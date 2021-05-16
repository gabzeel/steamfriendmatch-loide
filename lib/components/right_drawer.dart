import 'package:flutter/material.dart';

class RightDrawer extends StatelessWidget {
  final VoidCallback onLogout;

  RightDrawer({Key key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                child: Text("Profile"),
              ),
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
              this.onLogout();
            },
          ),
        ],
      ),
    );
  }
}
