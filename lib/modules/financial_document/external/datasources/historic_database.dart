import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/historic_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';

class HistoricDataBase implements HistoricDatasource {
  final DatabaseMock db;

  HistoricDataBase(this.db);
  @override
  void removeEntry(EntryHistoryModel model) {
    List<FinancialDocumentModel> documents = [];
    for (FinancialDocumentModel document in db.getFinancialDocuments()) {
      document.entries?.removeWhere((element) => element.day == model.day);
      documents.add(document);
    }
    db.setFinancialDocuments(documents);
  }

  @override
  void removeExit(ExitHistoryModel model) {
    List<FinancialDocumentModel> documents = [];
    for (FinancialDocumentModel document in db.getFinancialDocuments()) {
      document.exits?.removeWhere((element) => element.day == model.day);
      documents.add(document);
    }
    db.setFinancialDocuments(documents);
  }
}
