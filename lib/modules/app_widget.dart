import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinFácil',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    ).modular();
  }
}