import 'dart:convert';

import 'package:finfacil_app/modules/financial_document/domain/enities/financial_document.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';

import 'exit_history_model.dart';

class FinancialDocumentModel {
  int id = 0;
  String description = '';
  double valueTotal = 0.00;
  DateTime dueDate = DateTime.now();
  double valueParcel = 0.00;
  int numberParcel = 0;
  List<EntryHistoryModel> entries = <EntryHistoryModel>[];
  List<ExitHistoryModel> exits = <ExitHistoryModel>[];

  FinancialDocumentModel({
    this.id,
    this.description,
    this.valueTotal,
    this.dueDate,
    this.valueParcel,
    this.numberParcel,
    this.entries,
    this.exits,
  });

  FinancialDocument toUnity() {
    final unity = FinancialDocument();

    unity.setId(this.id);
    unity.setDescription(this.description);
    unity.setDueDate(this.dueDate);
    unity.setEntries(this.entries?.map((e) => e.toUnity())?.toList() ?? []);
    unity.setExits(this.exits?.map((e) => e.toUnity())?.toList() ?? []);
    unity.setNumberParcel(this.numberParcel);
    unity.setValueParcel(this.valueParcel);

    return unity;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'valueTotal': valueTotal,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'valueParcel': valueParcel,
      'numberParcel': numberParcel,
      'entries': entries.map((x) => x.toMap()).toList(),
      'exits': exits.map((x) => x.toMap()).toList(),
    };
  }

  factory FinancialDocumentModel.fromMap(Map<String, dynamic> map) {
    return FinancialDocumentModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      valueTotal: map['valueTotal']?.toDouble() ?? 0.0,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      valueParcel: map['valueParcel']?.toDouble() ?? 0.0,
      numberParcel: map['numberParcel']?.toInt() ?? 0,
      entries: List<EntryHistoryModel>.from(
          map['entries']?.map((x) => EntryHistoryModel.fromMap(x))).toList(),
      exits: List<ExitHistoryModel>.from(
          map['exits']?.map((x) => ExitHistoryModel.fromMap(x))).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialDocumentModel.fromJson(String source) {
    return FinancialDocumentModel.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'FinancialDocumentModel(id: $id, description: $description, valueTotal: $valueTotal, dueDate: $dueDate, valueParcel: $valueParcel, numberParcel: $numberParcel, entries: $entries, exits: $exits)';
  }
}
