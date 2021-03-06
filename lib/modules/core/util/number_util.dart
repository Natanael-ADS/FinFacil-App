import 'package:finfacil_app/modules/core/error/Failure.dart';
import 'package:intl/intl.dart';

class NumberUtil {
  static String douToStr(double number) {
    NumberFormat nf = NumberFormat("0.00");
    return nf.format(number);
  }

  static double strToDou(String number) {
    try {
      return double.parse(douCommaToPoint(number));
    } catch (e, s) {
      Failure.log(e, s);
      return 0.00;
    }
  }

  static String douCommaToPoint(String number) {
    if (number.isEmpty) {
      number = "0.00";
    }
    number = number.replaceAll(",", ".");

    return number;
  }

  static String douToStrReal(double number) {
    try {
      return "R\$ ${douToStr(number)}";
    } catch (e, s) {
      Failure.log(e, s);
      return "R\$ 0.00";
    }
  }

  static int strToInt(String number) {
    try {
      return strToDou(number).toInt();
    } catch (e, s) {
      Failure.log(e, s);
      return 0;
    }
  }
}
