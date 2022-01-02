import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';

abstract class AddDocumentRepository {
  void add(FinancialDocument document);
}
