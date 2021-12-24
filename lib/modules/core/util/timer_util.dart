import 'dart:async';

class TimerUtil {
  static start(int seconds, Function function) {
    var duration = Duration(seconds: seconds);
    Timer(duration, function);
  }
}
