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
    StatusAddDocument status = StatusError();
    try {
      if (_validate(document)) {
        repository.add(document);
        status = StatusOK();
      }
    } on Exception catch (e) {
      status = StatusError(error: e);
    }
    return status;
  }

  bool _validate(FinancialDocument document) {
    var isOK = true;
    if (isOK) {
      isOK = _validateEntryAndExit(document);
    }
    return isOK;
  }

  bool _validateEntryAndExit(FinancialDocument document) {
    bool isNull = false;
    for (var entry in document.getEntries()) {
      if (entry.getDay() == null) {
        isNull = true;
      }
    }

    for (var exit in document.getExits()) {
      if (exit.getDay() == null) {
        isNull = true;
      }
    }

    if (isNull) {
      StatusError(msg: "Entrada e saida sem data!");
    }
    return isNull == false;
  }
}
