import 'package:finfacil_app/modules/core/error/Failure.dart';
import 'package:finfacil_app/modules/core/util/number_util.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_entry_exit.dart';

abstract class SearchEntryAndExit {
  Future<StatusEntryExit> call(DateTime date);
}

class SearchEntryAndExitImpl implements SearchEntryAndExit {
  final SearchFinancialRepository repository;

  SearchEntryAndExitImpl(this.repository);
  @override
  Future<StatusEntryExit> call(DateTime date) async {
    StatusEntryExit status = StatusError();
    try {
      final documents = await repository.search(date);
      status = _calculate(documents);
    } catch (e, s) {
      Failure.log(e, s);
    }
    return status;
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
    success.valueDifferent = NumberUtil.douToStr(valueDifferent);
    success.valueEntries = NumberUtil.douToStr(valueEntries);
    success.valueExits = NumberUtil.douToStr(valueExits);
    return success;
  }
}
