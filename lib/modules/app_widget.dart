import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinFácil',
      theme: ThemeData(
        primarySwatch: ColorConst.THEME_1,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(color: ColorConst.TEXT_2, fontSize: 22),
        ),
      ),
    ).modular();
  }
}
