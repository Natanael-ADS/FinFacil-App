import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/core/util/dialog_util.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_entry_exit.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/search_entry_and_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final searchEntryAndExit = Modular.get<SearchEntryAndExitImpl>();

  @observable
  DateTime dateCurrent = DateTime.now();

  @observable
  StatusEntryExit status = StatusError();

  @action
  void nextDate(BuildContext context) {
    dateCurrent = dateCurrent.add(Duration(days: 31));
    _search(context);
  }

  @action
  void previousDate(BuildContext context) {
    dateCurrent = dateCurrent.add(Duration(days: -31));
    _search(context);
  }

  String showDate() => DatetimeUtil.getMonthYear(dateCurrent);

  void _search(BuildContext context) async {
    status = await searchEntryAndExit(dateCurrent);

    if (status is StatusError) {
      DialogUtil.showError(context);
    }
  }
}
