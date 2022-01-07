import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/external/datasources/financial_document_database.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final db = DatabaseMock();
  final datasource = FinancialDocumentDataBase(db);
  testWidgets('return success 1 ...', (tester) async {
    final result = await datasource.searchFromDate(DateTime(2021, 12, 01));

    expect(result, isNotEmpty);
    expect(result.length, 2);
  });

  testWidgets('return success 2 ...', (tester) async {
    final result = await datasource.searchFromDate(DateTime(2021, 11, 01));

    expect(result, isNotEmpty);
    expect(result.length, 1);
  });

  testWidgets('return success 3 ...', (tester) async {
    final day = DateTime(2021, 01, 01);
    datasource.add(
      FinancialDocumentModel(
        id: 0,
        numberParcel: 1,
        valueParcel: 100,
        dueDate: null,
        description: "salario",
        entries: [
          EntryHistoryModel(day: day, launch: null, id: null),
        ],
      ),
    );

    final result = await datasource.searchFromDate(day);

    expect(result, isNotEmpty);
    expect(result.length, 1);
  });
}
