import 'package:finfacil_app/modules/core/custom/historic_item_custom.dart';
import 'package:finfacil_app/modules/core/status/status_payment.dart';
import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/core/util/dialog_util.dart';
import 'package:finfacil_app/modules/core/util/number_util.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_entry_exit.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/search_entry_and_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final searchEntryAndExit = Modular.get<SearchEntryAndExitImpl>();
  List<Widget> rows = <Widget>[];

  @observable
  DateTime dateCurrent = DateTime.now();

  @observable
  StatusEntryExit status = Error();

  @action
  void nextDate() {
    dateCurrent = dateCurrent.add(Duration(days: 31));
  }

  @action
  void previousDate() {
    dateCurrent = dateCurrent.add(Duration(days: -31));
  }

  String showDate(BuildContext context) {
    _search(context);
    return DatetimeUtil.getMonthYear(dateCurrent);
  }

  void _search(BuildContext context) async {
    status = await searchEntryAndExit(dateCurrent);

    if (status is Error) {
      DialogUtil.showError(context);
    }
  }

  List<Widget> getHistorics() {
    rows.clear();
    for (var document in status.getDocuments()) {
      for (var entry in document.getEntries()) {
        rows.add(
          HistoricItemCustom(
            date: DatetimeUtil.getStringFromDate(entry.getDay()),
            description: document.getDescription(),
            typeLaunch: entry.getLaunch().getDescription(),
            valuePaid: NumberUtil.douToStrReal(document.getValueParcel()),
            statusPayment: Paid(),
          ),
        );
      }
      for (var exit in document.getExits()) {
        rows.add(
          HistoricItemCustom(
            date: DatetimeUtil.getStringFromDate(exit.getDay()),
            description: document.getDescription(),
            typeLaunch: exit.getLaunch().getDescription(),
            valuePaid: NumberUtil.douToStrReal(document.getValueParcel()),
            isEntry: false,
            statusPayment: Overdue(),
          ),
        );
      }
    }

    return rows ?? [HistoricItemCustom()];
  }

  void removeHistoric(int index) {
    final row = rows.elementAt(index);
    //create the remove
  }
}
