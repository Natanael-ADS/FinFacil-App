import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  testWidgets('showDate ...', (tester) async {
    final store = HomeStore();
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('nextDate ...', (tester) async {
    final store = HomeStore();
    store.nextDate();
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('previousDate ...', (tester) async {
    final store = HomeStore();
    store.previousDate();
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });
}
