import 'package:finfacil_app/modules/financial_document/domain/enities/history_type.dart';

abstract class RemoveHistoricRepository {
  void execute(HistoryType historic);
}
