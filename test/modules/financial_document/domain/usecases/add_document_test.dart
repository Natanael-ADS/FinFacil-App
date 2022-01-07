import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/add_document_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_add_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/add_document.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_document_test.mocks.dart';

@GenerateMocks([AddDocumentRepository])
void main() {
  final repository = MockAddDocumentRepository();
  final usecase = AddDocumentImpl(repository);
  testWidgets('add document - OK...', (tester) async {
    when(repository.add(any)).thenAnswer((_) => FinancialDocument());

    final result = await usecase(FinancialDocument());

    expect(result, isA<StatusOK>());
  });

  testWidgets('add document - ERROR...', (tester) async {
    when(repository.add(any)).thenThrow(Exception());

    final result = await usecase(FinancialDocument());

    expect(result, isA<StatusError>());
  });

  testWidgets('add without day in entry or exity erros...', (tester) async {
    var document = FinancialDocument();
    document.setEntries([EntryHistory(day: null)]);
    final result = await usecase(document);

    expect(result, isA<StatusError>());
  });
}
