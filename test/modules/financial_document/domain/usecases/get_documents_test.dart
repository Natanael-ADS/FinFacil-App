import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/get_documents.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_documents_test.mocks.dart';

@GenerateMocks([SearchFinancialRepository])
void main() {
  final repository = MockSearchFinancialRepository();
  final usecase = GetDocumentsImpl(repository);
  testWidgets('success ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async => <FinancialDocument>[]);

    final result = await usecase(DateTime.now());

    expect(result, isA<List<FinancialDocument>>());
  });

  testWidgets('error ...', (tester) async {
    when(repository.search(any)).thenThrow(Exception("Erro encontrado"));

    final result = await usecase(DateTime.now());

    expect(result, isA<List<FinancialDocument>>());
  });
}
