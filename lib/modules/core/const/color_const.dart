import 'package:flutter/material.dart';

class ColorConst {
  static const THEME_1 = MaterialColor(0xFFFF7F27, _customOrange);
  static const THEME_2 = MaterialColor(0xFF585858, _customGray);
  static const THEME_3 = Colors.white;

  static const TEXT_1 = MaterialColor(0xFF585858, _customGray);
  static const TEXT_2 = Colors.white;

  static const Map<int, Color> _customOrange = {
    50: Color(0xFFFBE9E7),
    100: Color(0xFFFFCCBC),
    200: Color(0xFFFFAB91),
    300: Color(0xFFFF8A65),
    400: Color(0xFFFF7043),
    500: Color(0xFFFF7F27),
    600: Color(0xFFF4511E),
    700: Color(0xFFE64A19),
    800: Color(0xFFD84315),
    900: Color(0xFFBF360C),
  };

  static const Map<int, Color> _customGray = {
    50: Colors.white,
    100: Color.fromARGB(100, 167, 167, 167),
    200: Color.fromARGB(200, 167, 167, 167),
    300: Color.fromARGB(300, 167, 167, 167),
    400: Color.fromARGB(400, 167, 167, 167),
    500: Color.fromARGB(500, 167, 167, 167),
    600: Color.fromARGB(600, 167, 167, 167),
    700: Color.fromARGB(700, 167, 167, 167),
    800: Color.fromARGB(800, 167, 167, 167),
    900: Color.fromARGB(900, 167, 167, 167),
  };
}
