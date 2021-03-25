import 'package:flutter/material.dart';
import 'package:streamfriendmatch/components/dashboard.dart';
import 'package:streamfriendmatch/components/right_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  int _screenIndex = 0;

  final List<Widget> _screens = [
    Dashboard(text: 'AA'),
    Dashboard(text: 'BB'),
    Dashboard(text: 'CC'),
  ];

  void _onItemTapped(BuildContext context, int index) {
    if (index == 3) {
      _scaffoldkey.currentState.openEndDrawer();
    } else {
      setState(() {
        _screenIndex = index;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: RightDrawer(),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'logout',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
    );
  }
}
