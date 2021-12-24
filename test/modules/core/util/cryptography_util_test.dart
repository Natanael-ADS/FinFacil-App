import 'package:finfacil_app/modules/core/util/cryptography_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('cryptography util ...', (tester) async {
    var content = "2021-12-01 00:30:15";
    var encrypt = Crypto.en(content);
    var decrypt = Crypto.de(encrypt);

    expect(decrypt, content);
  });
}
