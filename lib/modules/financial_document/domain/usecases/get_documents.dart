import 'package:finfacil_app/modules/core/error/Failure.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';

abstract class GetDocuments {
  Future<List<FinancialDocument>> call(DateTime date);
}

class GetDocumentsImpl implements GetDocuments {
  final SearchFinancialRepository repository;

  GetDocumentsImpl(this.repository);
  @override
  Future<List<FinancialDocument>> call(DateTime date) async {
    var documents = <FinancialDocument>[];
    try {
      documents = await repository.search(date);
    } catch (e, s) {
      Failure.log(e, s);
    }

    return documents;
  }
}
