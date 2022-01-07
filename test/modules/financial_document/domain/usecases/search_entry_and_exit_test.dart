import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/exit_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/search_financial_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/status/status_entry_exit.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/search_entry_and_exit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_entry_and_exit_test.mocks.dart';

@GenerateMocks([SearchFinancialRepository])
void main() {
  final repository = MockSearchFinancialRepository();
  final usecase = SearchEntryAndExitImpl(repository);

  testWidgets('return StatusSuccess different 100 ...', (tester) async {
    when(repository.search(any)).thenAnswer((realInvocation) async {
      final document = FinancialDocument();
      document.setValueParcel(100);
      document.setEntries([EntryHistory(), EntryHistory()]);
      document.setExits([ExitHistory()]);
      return [document];
    });

    final result = await usecase(DateTime.now());
    expect(result, isA<StatusSuccess>());
    expect(result.getValueInput(), 'R\$ 200.00');
    expect(result.getValueDifferent(), 'R\$ 100.00');
  });
  testWidgets('return Error...', (tester) async {
    when(repository.search(any)).thenAnswer((realInvocation) => null);

    final result = await usecase(DateTime.now());
    expect(result, isA<StatusError>());
  });

  testWidgets('return StatusSuccess different -100...', (tester) async {
    when(repository.search(any)).thenAnswer((realInvocation) async {
      final document = FinancialDocument();
      document.setValueParcel(100);
      document.setEntries([EntryHistory()]);
      document.setExits([ExitHistory(), ExitHistory()]);
      return [document];
    });

    final result = await usecase(DateTime.now());
    expect(result, isA<StatusSuccess>());
    expect(result.getValueOutput(), 'R\$ 200.00');
    expect(result.getValueDifferent(), 'R\$ -100.00');
  });
}
