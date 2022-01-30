import 'package:finfacil_app/modules/core/const/route_const.dart';
import 'package:finfacil_app/modules/core/const/string_const.dart';
import 'package:finfacil_app/modules/core/util/datetime_util.dart';
import 'package:finfacil_app/modules/core/util/number_util.dart';
import 'package:finfacil_app/modules/core/util/snackbar_util.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_add_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/add_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'launch_store.g.dart';

class LaunchStore = _LaunchStoreBase with _$LaunchStore;

abstract class _LaunchStoreBase with Store {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController parcelValueController = TextEditingController();
  TextEditingController numberParcelController = TextEditingController();
  TextEditingController numberParcelPaidController = TextEditingController();
  final save = Modular.get<AddDocumentImpl>();
  FinancialDocument document = FinancialDocument();
  bool isEntry = false;

  @observable
  String totalPaid = "R\$ 0.00";

  @observable
  String totalPending = "R\$ 0.00";

  @observable
  String totalValue = "R\$ 0.00";

  @action
  void calculeTotal() {
    document.setValueParcel(NumberUtil.strToDou(parcelValueController.text));
    document.setNumberParcel(NumberUtil.strToInt(numberParcelController.text));

    int number = NumberUtil.strToInt(numberParcelPaidController.text);
    if (isEntry) {
      document.setNumberEntryAndType(number, "N/D");
    } else {
      document.setNumberExityAndType(number, "N/D");
    }

    totalPaid = NumberUtil.douToStrReal(document.totalValueEntriesOrExits());
    totalValue = NumberUtil.douToStrReal(document.totalValue());
    totalPending = NumberUtil.douToStrReal(
      document.totalValueWithoutEntriesOrExits(),
    );
  }

  @observable
  String showLaunch = "n/d";

  @action
  void setTypeLaunch(String type) {
    isEntry = (type == StringConst.ENTRY);
    if (isEntry) {
      showLaunch = StringConst.ENTRY;
      document = FinancialDocument();
    } else {
      showLaunch = StringConst.EXIT;
      document = FinancialDocument();
    }
    calculeTotal();
  }

  void saveDocument(BuildContext context) async {
    document.setDueDate(
      DatetimeUtil.strToDate("${dueDateController.text}/01/1990"),
    );
    document.setDescription(descriptionController.text);

    final state = await save(document);

    if (state is StatusOK) {
      SnackbarUtil.success(context, StringConst.SAVED);
      Modular.to.navigate(RouteConst.HOME);
    } else {
      SnackbarUtil.error(context, StringConst.ERROR);
    }
  }
}
