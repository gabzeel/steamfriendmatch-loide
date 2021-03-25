import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String text;

  Dashboard({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
