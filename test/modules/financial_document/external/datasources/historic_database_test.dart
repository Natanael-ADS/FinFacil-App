import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/external/datasources/historic_database.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/launch_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final db = DatabaseMock();
  final datasource = HistoricDataBase(db);
  testWidgets('historic database - ENTRY ...', (tester) async {
    final model = EntryHistoryModel(
      day: DateTime(2021, 12, 01),
      launch: LaunchTypeModel(description: "EXTRA"),
    );
    datasource.removeEntry(model);

    int actual = 0;
    for (var document in db.getFinancialDocuments()) {
      actual += document.entries?.length ?? 0;
    }
    expect(actual, 1);
  });

  testWidgets('historic database - EXIT ...', (tester) async {
    final model = ExitHistoryModel(
      day: DateTime(2021, 12, 26),
      launch: LaunchTypeModel(description: "CARNE"),
    );
    datasource.removeExit(model);

    int actual = 0;
    for (var document in db.getFinancialDocuments()) {
      actual += document.exits?.length ?? 0;
    }
    expect(actual, 2);
  });
}
