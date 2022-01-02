import 'dart:ffi';

import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/add_document_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'search_financial_repository_impl_test.mocks.dart';

void main() {
  final datasource = MockFinancialDatasource();
  final repository = AddDocumentRepositoryImpl(datasource);
  testWidgets('add document repository impl ...', (tester) async {
    when(datasource.add(any)).thenAnswer((_) {
      return;
    });

    repository.add(FinancialDocument());
  });
}
