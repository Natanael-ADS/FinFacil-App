import 'package:finfacil_app/modules/core/error/Failure.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/history_type.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/remove_historic_repository.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/historic_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';

class RemoveHistoricRepositoryImpl extends RemoveHistoricRepository {
  final HistoricDatasource datasource;

  RemoveHistoricRepositoryImpl(this.datasource);
  @override
  void execute(HistoryType historic) {
    try {
      if (historic is EntryHistory) {
        final model = EntryHistoryModel.fromUnity(historic);
        datasource.removeEntry(model);
        return;
      }

      final model = ExitHistoryModel.fromUnity(historic);
      datasource.removeExit(model);
    } catch (e, s) {
      Failure.log(e, s);
    }
  }
}
