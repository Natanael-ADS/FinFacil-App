import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';

abstract class FinancialDatasource {
  Future<List<FinancialDocumentModel>> searchFromDate(DateTime date);
  void add(FinancialDocumentModel model);
}
