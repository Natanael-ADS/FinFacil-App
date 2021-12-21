import 'package:finfacil_app/modules/login/presenter/sign_in/sign_in_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = SignInStore();
  final edtNameController = TextEditingController();
  final edtPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finfacil"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          top: 150,
        ),
        child: Column(
          children: [
            _edtName(),
            _edtPassword(),
            SizedBox(height: 10),
            _btnLogin(),
          ],
        ),
      ),
    );
  }

  Widget _edtName() {
    return TextField(
      controller: edtNameController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_sharp),
        label: Text("Name"),
      ),
    );
  }

  Widget _edtPassword() {
    return Observer(builder: (_) {
      return TextField(
        controller: edtPasswordController,
        obscureText: store.isVisibilityPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.security),
          label: Text("Password"),
          suffixIcon: IconButton(
            icon: Icon(
              store.isVisibilityPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () => store.setVisibilityPassword(),
          ),
        ),
      );
    });
  }

  Widget _btnLogin() {
    return ElevatedButton(
      onPressed: () async {
        final result = await store.loadingLogin(
          name: edtNameController.text,
          password: edtPasswordController.text,
        );
        result.showMessage(context);
      },
      child: Text("Sign In"),
    );
  }

  _alertDialog({String contentText}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Warning!"),
          content: Text(contentText),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
