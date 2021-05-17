import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RightDrawerController extends ControllerMVC {
  factory RightDrawerController(BuildContext context) {
    if (_this == null) _this = new RightDrawerController._();
    return _this;
  }

  CameraController _cameraController;

  static RightDrawerController _this = new RightDrawerController._();

  RightDrawerController._();

  static RightDrawerController get con => _this;
  CameraController get camera => _this._cameraController;

  Future<void> initializeCamera() async {
    final camerasOptions = await availableCameras();

    final firstCamera = camerasOptions.first;

    this._cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await this._cameraController.initialize();
  }
}
