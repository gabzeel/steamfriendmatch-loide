import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<String> getProfilePhotoUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String photoKey = prefs.get("photoKey").toString();
    return "http://10.0.2.2:3000/files/" + photoKey;
  }

  static Future<String> getProfileUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("username").toString();
  }

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
