import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/financial_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/search_financial_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_financial_repository_impl_test.mocks.dart';

@GenerateMocks([FinancialDatasource])
void main() {
  final datasource = MockFinancialDatasource();
  final repository = SearchFinancialRepositoryImpl(datasource);
  testWidgets('return success ...', (tester) async {
    when(datasource.searchFromDate(any))
        .thenAnswer((_) async => [FinancialDocumentModel()]);

    final result = await repository.search(DateTime.now());

    expect(result, isA<List<FinancialDocument>>());
    expect(result, isNotEmpty);
  });
}
