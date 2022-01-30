import 'package:finfacil_app/modules/core/const/error_const.dart';
import 'package:finfacil_app/modules/core/const/number_const.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';

abstract class StatusEntryExit {
  String getValueInput();
  String getValueOutput();
  String getValueDifferent();
  String getMessage();
  List<FinancialDocument> getDocuments();
}

class Error implements StatusEntryExit {
  @override
  String getMessage() => ErrorConst.SEARCH_FINANCIAL;

  @override
  String getValueDifferent() => ErrorConst.VALUE_ZERO;

  @override
  String getValueInput() => ErrorConst.VALUE_ZERO;

  @override
  String getValueOutput() => ErrorConst.VALUE_ZERO;

  @override
  List<FinancialDocument> getDocuments() => <FinancialDocument>[];
}

class Success implements StatusEntryExit {
  String valueDifferent = NumberConst.DOUBLE_STRING;
  String valueEntries = NumberConst.DOUBLE_STRING;
  String valueExits = NumberConst.DOUBLE_STRING;
  final List<FinancialDocument> documents;

  Success(this.documents);

  @override
  String getMessage() => '';

  @override
  String getValueDifferent() => "R\$ ${this.valueDifferent}";

  @override
  String getValueInput() => "R\$ ${this.valueEntries}";

  @override
  String getValueOutput() => "R\$ ${this.valueExits}";

  @override
  List<FinancialDocument> getDocuments() => documents;
}
