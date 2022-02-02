import 'package:finfacil_app/modules/core/error/Failure.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/history_type.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/remove_historic_repository.dart';

abstract class RemoveHistoric {
  Future<void> call(HistoryType historic);
}

class RemoveHistoricImpl implements RemoveHistoric {
  final RemoveHistoricRepository repository;

  RemoveHistoricImpl(this.repository);

  @override
  Future<void> call(HistoryType historic) async {
    try {
      repository.execute(historic);
    } catch (e, s) {
      Failure.log(e, s);
    }
  }
}
