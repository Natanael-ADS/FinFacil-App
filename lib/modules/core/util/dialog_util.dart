import 'package:flutter/material.dart';

class DialogUtil {
  static const TITLE = "Warning!";

  static showSuccess(
    BuildContext context, {
    String content,
    bool blockDismissible = false,
    String title = TITLE,
    ElevatedButton btnOK,
  }) {
    return _alertDialog(
      context,
      background: Colors.green,
      blockDismissible: blockDismissible,
      content: Text(content, style: TextStyle(color: Colors.white)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      btnOK: btnOK,
    );
  }

  static showAlert(
    BuildContext context, {
    String content,
    bool blockDismissible = false,
    String title = TITLE,
    ElevatedButton btnOK,
  }) {
    return _alertDialog(
      context,
      background: Colors.orange,
      blockDismissible: blockDismissible,
      content: Text(content, style: TextStyle(color: Colors.white)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      btnOK: btnOK,
    );
  }

  static showInfo(
    BuildContext context, {
    String content,
    bool blockDismissible = false,
    String title = TITLE,
    ElevatedButton btnOK,
  }) {
    return _alertDialog(
      context,
      background: Colors.lightBlue,
      blockDismissible: blockDismissible,
      content: Text(content, style: TextStyle(color: Colors.white)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      btnOK: btnOK,
    );
  }

  static showError(
    BuildContext context, {
    String content,
    bool blockDismissible = false,
    String title = TITLE,
    ElevatedButton btnOK,
  }) {
    return _alertDialog(
      context,
      background: Colors.red,
      blockDismissible: blockDismissible,
      content: Text(content, style: TextStyle(color: Colors.white)),
      title: Text(title, style: TextStyle(color: Colors.white)),
      btnOK: btnOK,
    );
  }

  static showQuestion(
    BuildContext context, {
    String content,
    bool blockDismissible = false,
    String title = TITLE,
    ElevatedButton btnOK,
    ElevatedButton btnCANCEL,
  }) {
    return _alertDialog(
      context,
      background: Colors.white,
      blockDismissible: blockDismissible,
      content: Text(content),
      title: Text(title),
      btnOK: btnOK,
      btnCANCEL: btnCANCEL,
    );
  }

  static _alertDialog(
    BuildContext context, {
    Text content,
    bool blockDismissible,
    Color background,
    Text title,
    ElevatedButton btnOK,
    ElevatedButton btnCANCEL,
  }) {
    var buttons = <ElevatedButton>[];

    if (btnOK != null) {
      buttons.add(btnOK);
    }

    if (btnCANCEL != null) {
      buttons.add(btnCANCEL);
    }

    if (buttons.isEmpty) {
      buttons.add(ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(background),
        ),
        child: Text("OK"),
        onPressed: () => Navigator.pop(context),
      ));
    }

    return showDialog(
      context: context,
      barrierDismissible: blockDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: background,
          title: title,
          content: content,
          actions: buttons,
        );
      },
    );
  }
}
