import 'package:finfacil_app/modules/financial_document/domain/enities/history_type.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/launch_type.dart';

class ExitHistory extends HistoryType {
  ExitHistory({int id, DateTime day, LaunchType launch})
      : super(id, day, launch);
}
