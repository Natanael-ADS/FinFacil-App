import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';

abstract class SearchFinancialRepository {
  Future<List<FinancialDocument>> search(DateTime date);
}
