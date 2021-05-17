import 'package:flutter/material.dart';
import 'package:streamfriendmatch/components/dashboard.dart';
import 'package:streamfriendmatch/components/post/discover.dart';
import 'package:streamfriendmatch/components/right_drawer/right_drawer.dart';
import 'package:streamfriendmatch/components/friend_match.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/views/chat/chat.dart';
import 'package:streamfriendmatch/views/home/controller.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends StateMVC<Home> {
  final HomeController _con = HomeController.con;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  int _screenIndex = 0;

  final List<Widget> _screens = [
    Dashboard(text: 'AA'),
    Discover(),
    FriendMatch(),
    Chat(),
  ];

  void _onItemTapped(int index) {
    if (index == _screens.length) {
      _scaffoldkey.currentState.openEndDrawer();
    } else if (_screenIndex != index) {
      setState(() {
        _screenIndex = index;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: RightDrawer(
          onLogout: () => {
                _con.loggout(() => {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false)
                    })
              }),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'menu',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
