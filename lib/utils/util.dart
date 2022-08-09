import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Utils {
  static showLoader(BuildContext context) {
    context.loaderOverlay.show();
  }

  static hideLoader(BuildContext context) {
    final isVisible = context.loaderOverlay.visible;
    if (isVisible) {
      context.loaderOverlay.hide();
    }
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength:
            (message.length > 20) ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
}
