import 'package:flutter/material.dart';

class SnackbarUtil {
  static void success(BuildContext context, String content) {
    _show(context, content, Colors.green);
  }

  static void alert(BuildContext context, String content) {
    _show(context, content, Colors.orange);
  }

  static void error(BuildContext context, String content) {
    _show(context, content, Colors.red);
  }

  static void info(BuildContext context, String content) {
    _show(context, content, Colors.blue);
  }

  static void _show(BuildContext context, String content, Color color) {
    var snackBar = SnackBar(
      content: Text(content),
      duration: Duration(seconds: 5),
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
