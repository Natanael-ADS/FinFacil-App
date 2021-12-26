import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/external/datasources/financial_document_database.dart';
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
}
