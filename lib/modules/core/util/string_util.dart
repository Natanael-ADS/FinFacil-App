import 'package:diacritic/diacritic.dart';
import 'package:finfacil_app/modules/core/error/Failure.dart';

class StringUtil {
  static String removeAccents(String content) {
    try {
      content = removeDiacritics(content);
      return content;
    } catch (e, s) {
      Failure.log(e, s);
      return content;
    }
  }
}
