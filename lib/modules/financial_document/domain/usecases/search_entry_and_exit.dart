import 'package:finfacil_app/modules/core/util/double_util.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';

import '../status_financial.dart';

abstract class SearchEntryAndExit {
  Future<StatusFinancial> call(DateTime date);
}

class SearchEntryAndExitImpl implements SearchEntryAndExit {
  final SearchFinancialRepository repository;

  SearchEntryAndExitImpl(this.repository);
  @override
  Future<StatusFinancial> call(DateTime date) async {
    try {
      final documents = await repository.search(date);
      return _calculate(documents);
    } catch (e) {
      return StatusError();
    }
  }

  StatusSuccess _calculate(List<FinancialDocument> documents) {
    double valueEntries = 0;
    double valueExits = 0;

    for (var document in documents) {
      valueEntries += document.totalValueEntries();
      valueExits += document.totalValueExits();
    }

    double valueDifferent = valueEntries - valueExits;

    final success = StatusSuccess();
    success.valueDifferent = DoubleUtil.doubleToString(valueDifferent);
    success.valueEntries = DoubleUtil.doubleToString(valueEntries);
    success.valueExits = DoubleUtil.doubleToString(valueExits);
    return success;
  }
}
