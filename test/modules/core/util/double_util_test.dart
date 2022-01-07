import 'package:finfacil_app/modules/core/util/number_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('double util: doubleToString return (15.00)...', (tester) async {
    var result = NumberUtil.douToStr(15.00);
    expect(result, "15.00");
  });

  testWidgets('double util: doubleToString return (15.53)...', (tester) async {
    var result = NumberUtil.douToStr(15.53);
    expect(result, "15.53");
  });

  test('doubleCommaToPoint(15,00) return (15.00)', () {
    var result = NumberUtil.douCommaToPoint("15,00");
    expect(result, '15.00');
  });

  test('doubleCommaToPoint(15,53) return (15.53)', () {
    var result = NumberUtil.douCommaToPoint("15,53");
    expect(result, '15.53');
  });

  test("stringToDouble(15,50)", () {
    var result = NumberUtil.strToDou("15,50");
    expect(result, 15.50);
  });
}
