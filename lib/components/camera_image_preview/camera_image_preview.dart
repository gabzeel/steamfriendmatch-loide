import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:streamfriendmatch/components/camera_image_preview/controller.dart';

class CameraImagePreview extends StatefulWidget {
  final CameraController imageController;

  const CameraImagePreview({Key key, this.imageController}) : super(key: key);
  @override
  _CameraImagePreviewState createState() => new _CameraImagePreviewState();
}

class _CameraImagePreviewState extends StateMVC<CameraImagePreview> {
  final CameraImagePreviewController _con = CameraImagePreviewController.con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: CameraPreview(widget.imageController),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
            final image = await widget.imageController.takePicture();
            await _con.uploadImage(image);
            Navigator.pop(context);
        },
      ),
    );
  }
}

