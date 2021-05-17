import 'package:flutter/cupertino.dart';
import 'package:sweetalert/sweetalert.dart';

void showAlert(BuildContext context) {
  SweetAlert.show(
    context,
    title: "Just show a message",
    subtitle: "Sweet alert is pretty",
    style: SweetAlertStyle.confirm,
    showCancelButton: true,
    onPress: (bool isConfirm) {
      if (isConfirm) {
        SweetAlert.show(context,
            style: SweetAlertStyle.success, title: "Success");

        return false;
      }

      return true;
    },
  );
}
