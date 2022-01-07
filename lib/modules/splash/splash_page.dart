import 'package:finfacil_app/modules/core/const/image_const.dart';
import 'package:finfacil_app/modules/core/const/route_const.dart';
import 'package:finfacil_app/modules/core/util/timer_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    _threading(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            _title(),
          ],
        ),
      ),
    );
  }

  _logo() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(ImageConst.LOADING),
    );
  }

  _title() {
    return Text(
      'FinFácil',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(88, 88, 88, 1),
      ),
    );
  }

  final isLogined = true;
  _threading(context) {
    TimerUtil.start(10, () {
      if (isLogined) {
        Modular.to.navigate(RouteConst.HOME);
      } else {
        Modular.to.navigate(RouteConst.LOGIN);
      }
    });
  }
}
