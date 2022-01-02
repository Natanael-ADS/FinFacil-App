import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'home_store_test.mocks.dart';

@GenerateMocks([BuildContext])
void main() {
  final context = MockBuildContext();
  testWidgets('showDate ...', (tester) async {
    final store = HomeStore();
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('nextDate ...', (tester) async {
    final store = HomeStore();
    store.nextDate(context);
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('previousDate ...', (tester) async {
    final store = HomeStore();
    store.previousDate(context);
    final result = store.showDate();
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });
}
