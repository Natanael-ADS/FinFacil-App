import 'package:finfacil_app/modules/app_module.dart';
import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';

import 'home_store_test.mocks.dart';

@GenerateMocks([BuildContext])
void main() {
  final context = MockBuildContext();
  initModule(AppModule());
  testWidgets('showDate ...', (tester) async {
    final store = HomeStore();
    final result = store.showDate(context);
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('nextDate ...', (tester) async {
    final store = HomeStore();
    store.nextDate();
    final result = store.showDate(context);
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });

  testWidgets('previousDate ...', (tester) async {
    final store = HomeStore();
    store.previousDate();
    final result = store.showDate(context);
    expect(result, DatetimeUtil.getMonthYear(store.dateCurrent));
  });
}
