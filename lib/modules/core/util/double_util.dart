import 'package:intl/intl.dart';

class DoubleUtil {
  static String doubleToString(double number) {
    NumberFormat nf = NumberFormat("0.00");
    return nf.format(number);
  }

  static double stringToDouble(String number) {
    return double.parse(doubleCommaToPoint(number));
  }

  static String doubleCommaToPoint(String number) {
    if (number.isEmpty) {
      number = "0.00";
    }
    number = number.replaceAll(",", ".");

    return number;
  }
}
