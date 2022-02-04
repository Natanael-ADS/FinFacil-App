import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/enities/exit_history.dart';
import 'package:finfacil_app/modules/financial_document/infra/datasources/historic_datasource.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/remove_historic_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_historic_repository_impl_test.mocks.dart';

@GenerateMocks([HistoricDatasource])
void main() {
  final datasource = MockHistoricDatasource();
  final repository = RemoveHistoricRepositoryImpl(datasource);
  testWidgets('erro - remove historic repository impl ...', (tester) async {
    when(datasource.removeEntry(any)).thenThrow(Exception());
    when(datasource.removeExit(any)).thenThrow(Exception());

    repository.execute(EntryHistory());
    repository.execute(ExitHistory());
  });

  testWidgets('success - remove historic repository impl ...', (tester) async {
    when(datasource.removeEntry(any)).thenAnswer((realInvocation) {});
    when(datasource.removeExit(any)).thenAnswer((realInvocation) {});

    repository.execute(EntryHistory());
    repository.execute(ExitHistory());
  });
}
