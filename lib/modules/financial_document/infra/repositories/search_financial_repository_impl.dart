import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/financial_datasource.dart';

class SearchFinancialRepositoryImpl implements SearchFinancialRepository {
  final FinancialDatasource datasource;

  SearchFinancialRepositoryImpl(this.datasource);

  @override
  Future<List<FinancialDocument>> search(DateTime date) async {
    final documents = await datasource.searchFromDate(date);
    return documents.map((e) => e.toUnity()).toList();
  }
}
