import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';

abstract class HistoricDatasource {
  void removeExit(ExitHistoryModel model);
  void removeEntry(EntryHistoryModel model);
}
