import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/add_document_repository.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/financial_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/launch_type_model.dart';

class AddDocumentRepositoryImpl implements AddDocumentRepository {
  final FinancialDatasource datasource;

  AddDocumentRepositoryImpl(this.datasource);
  @override
  void add(FinancialDocument document) async {
    final model = FinancialDocumentModel(
      id: document.getId(),
      description: document.getDescription(),
      entries: document.getEntries().map((e) {
        final launch = e.getLaunch();

        return EntryHistoryModel(
          id: e.getId(),
          day: e.getDay(),
          launch: LaunchTypeModel(
            id: launch.getId(),
            description: launch.getDescription(),
          ),
        );
      }).toList(),
      exits: document.getExits().map((e) {
        final launch = e.getLaunch();

        return ExitHistoryModel(
          id: e.getId(),
          day: e.getDay(),
          launch: LaunchTypeModel(
            id: launch.getId(),
            description: launch.getDescription(),
          ),
        );
      }).toList(),
      numberParcel: document.getNumberParcel(),
      valueParcel: document.getValueParcel(),
      valueTotal: document.totalValue(),
    );
    await datasource.add(model);
  }
}
