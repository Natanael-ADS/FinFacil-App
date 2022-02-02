import 'dart:ffi';

import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/domain/repositories/remove_historic_repository.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/remove_historic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_historic_test.mocks.dart';

@GenerateMocks([RemoveHistoricRepository])
void main() {
  final repository = MockRemoveHistoricRepository();
  final usecase = RemoveHistoricImpl(repository);
  testWidgets('error - remove historic ...', (tester) async {
    when(repository.execute(any)).thenThrow(Exception());

    final historic = EntryHistory();
    usecase(historic);
  });

  testWidgets('success - remove historic ...', (tester) async {
    when(repository.execute(any)).thenReturn(() {});

    final historic = EntryHistory();
    usecase(historic);
  });
}
