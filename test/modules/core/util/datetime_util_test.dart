import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('getDate ...', (tester) async {
    var result = DatetimeUtil.getDate(
      "2021-12-23 00:00:00",
      DatetimeUtil.FORMAT_DATE_TIME_BD,
    );
    expect(result, DateTime(2021, 12, 23));
  });

  test('getStringFromDate', () {
    var result =
        DatetimeUtil.getStringFromDate(DateTime(2021, 12, 23, 14, 30, 00));
    expect(result, "23/12/2021 02:30:00"); //pm
  });

  test('getMonthYear', () {
    var result = DatetimeUtil.getMonthYear(DateTime(2021, 12, 23, 14, 30, 00));
    expect(result, "Dezembro/2021"); //pm
  });
}
