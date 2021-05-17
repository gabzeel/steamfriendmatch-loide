import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CameraImagePreviewController extends ControllerMVC {
  factory CameraImagePreviewController(BuildContext context) {
    if (_this == null) _this = new CameraImagePreviewController._();
    return _this;
  }

  CameraController _cameraController;

  static CameraImagePreviewController _this =
      new CameraImagePreviewController._();

  CameraImagePreviewController._();

  static CameraImagePreviewController get con => _this;
  CameraController get camera => _this._cameraController;

  Future<void> uploadImage(XFile file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtToken = prefs.get("tokenjwt").toString();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken);

    final String userId = decodedToken['user']['id'];
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://10.0.2.2:3000/users/" + userId + "/profile"));

    request.files.add(http.MultipartFile.fromBytes(
        'file', File(file.path).readAsBytesSync(),
        filename: "file"));

    var response = await request.send();

    final respStr = await response.stream.bytesToString();
    Map mapResponse = json.decode(respStr);
    prefs.setString("photoKey", mapResponse['fileKey']);
  }
}
