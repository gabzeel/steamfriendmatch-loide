import 'package:flutter/cupertino.dart';
import 'package:sweetalert/sweetalert.dart';

void showAlert(BuildContext context, String message, SweetAlertStyle style) {
  SweetAlert.show(
    context,
    title: "OPS! Aconteceu um erro",
    subtitle: message,
    style: style,
    confirmButtonText: 'OK',
  );
}
