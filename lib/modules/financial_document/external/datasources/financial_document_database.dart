import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/financial_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';

class FinancialDocumentDataBase implements FinancialDatasource {
  final DatabaseMock db;

  FinancialDocumentDataBase(this.db);

  @override
  Future<List<FinancialDocumentModel>> searchFromDate(DateTime date) async {
    List<FinancialDocumentModel> models = db.getFinancialDocuments();

    var documents = models.where(
      (m) {
        bool hasEntries = m.entries
            ?.where((e) => e.day.month == date.month)
            ?.toList()
            ?.isNotEmpty;

        bool hasExits = m.exits
            ?.where((e) => e.day.month == date.month)
            ?.toList()
            ?.isNotEmpty;

        return hasEntries ?? false || hasExits ?? false;
      },
    );

    return documents.toList();
  }

  @override
  void add(FinancialDocumentModel model) {
    db.setFinancialDocument(model);
  }
}
