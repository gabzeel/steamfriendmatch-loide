import 'package:flutter/material.dart';

class CameraImageDisplay extends StatelessWidget {
  final String image;

  CameraImageDisplay({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Camera display');
  }
}