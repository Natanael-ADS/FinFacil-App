import 'package:finfacil_app/modules/core/util/double_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('double util: doubleToString return (15.00)...', (tester) async {
    var result = DoubleUtil.doubleToString(15.00);
    expect(result, "15.00");
  });

  testWidgets('double util: doubleToString return (15.53)...', (tester) async {
    var result = DoubleUtil.doubleToString(15.53);
    expect(result, "15.53");
  });

  test('doubleCommaToPoint(15,00) return (15.00)', () {
    var result = DoubleUtil.doubleCommaToPoint("15,00");
    expect(result, '15.00');
  });

  test('doubleCommaToPoint(15,53) return (15.53)', () {
    var result = DoubleUtil.doubleCommaToPoint("15,53");
    expect(result, '15.53');
  });

  test("stringToDouble(15,50)", () {
    var result = DoubleUtil.stringToDouble("15,50");
    expect(result, 15.50);
  });
}
