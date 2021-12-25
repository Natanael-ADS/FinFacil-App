import 'package:finfacil_app/modules/financial_document/domain/enities/history_type.dart';

import 'launch_type.dart';

class EntryHistory extends HistoryType {
  EntryHistory({
    int id,
    DateTime day,
    LaunchType launch,
  }) : super(id, day, launch);
}
