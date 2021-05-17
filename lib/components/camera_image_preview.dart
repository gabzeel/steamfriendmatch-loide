import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraImagePreview extends StatelessWidget {
  final CameraController imageController;

  const CameraImagePreview({Key key, this.imageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: CameraPreview(this.imageController),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
            final image = await imageController.takePicture();
        },
      ),
    );
  }
}
