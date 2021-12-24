// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class DatetimeUtil {
  static const String FORMAT_DATE_BD = "yyyy-MM-dd";
  static const String FORMAT_DATE_TIME_BD = "yyyy-MM-dd hh:mm:ss";
  static const String FORMATO_DATE = "dd/MM/yyyy";
  static const String FORMAT_DATE_TIME = "dd/MM/yyyy hh:mm:ss";

  static final DATETIME_INVALIDATE = DateTime(1980, 01, 01);

  static String getStringFromDateTime(String data) {
    List<String> calendario = data.replaceAll(RegExp("[/-]"), " ").split(" ");
    String dia = calendario[0];
    String mes = calendario[1];
    String ano = calendario[2];
    String hora = calendario[3];

    String datahora = "$ano-$mes-$dia $hora";

    return datahora.toString();
  }

  static String getStringFromDate(DateTime date) {
    return DateFormat(FORMAT_DATE_TIME).format(date);
  }

  static DateTime strToDate(String data) {
    try {
      if (data.contains('.')) {
        data = data.split(".")[0];
      }

      DateFormat formatter = DateFormat(FORMATO_DATE);
      DateTime date = formatter.parse(data);
      return date;
    } on Exception catch (e) {
      print(e);
      return DATETIME_INVALIDATE;
    }
  }

  static DateTime getDate(String dbDate, String format) {
    try {
      DateFormat dateFormat = DateFormat(format);
      DateTime data = dateFormat.parse(dbDate);

      return data;
    } on Exception catch (e) {
      print(e);
      return DATETIME_INVALIDATE;
    }
  }
}
