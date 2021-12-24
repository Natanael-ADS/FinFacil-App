import 'package:diacritic/diacritic.dart';

class StringUtil {
  static String removeAccents(String content) {
    try {
      content = removeDiacritics(content);
      return content;
    } on Exception catch (e) {
      print(e);
      return content;
    }
  }
}
