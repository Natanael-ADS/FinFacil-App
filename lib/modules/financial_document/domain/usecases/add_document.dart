import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/add_document_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_add_document.dart';

abstract class AddDocument {
  Future<StatusAddDocument> call(FinancialDocument document);
}

class AddDocumentImpl implements AddDocument {
  final AddDocumentRepository repository;

  AddDocumentImpl(this.repository);
  @override
  Future<StatusAddDocument> call(FinancialDocument document) async {
    try {
      repository.add(document);
      return StatusOK();
    } on Exception catch (e) {
      return StatusError(e);
    }
  }
}
