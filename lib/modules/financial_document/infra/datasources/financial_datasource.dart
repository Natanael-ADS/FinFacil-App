import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';

abstract class FinancialDatasource {
  Future<List<FinancialDocumentModel>> searchFromDate(DateTime date);
}
