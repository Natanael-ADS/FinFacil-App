import 'package:finfacil_app/modules/core/util/string_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('String Util RemoveAccents ...', (tester) async {
    final result = StringUtil.removeAccents("Natanael Cândido é Lindão");
    expect(result, "Natanael Candido e Lindao");
  });
}
