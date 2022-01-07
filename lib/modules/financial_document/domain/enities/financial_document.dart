import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';

import 'exit_history.dart';

class FinancialDocument {
  int _id = 0;
  String _description = '';
  DateTime _dueDate = DateTime.now();
  double _valueParcel = 0.00;
  int _numberParcel = 0;
  List<EntryHistory> _entries = <EntryHistory>[];
  List<ExitHistory> _exits = <ExitHistory>[];

  FinancialDocument();

  int getId() => _id;
  void setId(int value) => _id = value;

  String getDescription() => _description;
  void setDescription(String value) => _description = value;

  DateTime getDueDate() => _dueDate;
  void setDueDate(DateTime value) => _dueDate = value;

  double getValueParcel() => _valueParcel;
  void setValueParcel(double value) => _valueParcel = value;

  int getNumberParcel() => _numberParcel;
  void setNumberParcel(int value) => _numberParcel = value;

  List<EntryHistory> getEntries() => _entries;
  void setEntries(List<EntryHistory> value) => _entries = value;

  List<ExitHistory> getExits() => _exits;
  void setExits(List<ExitHistory> value) => _exits = value;

  double totalValueEntries() => _valueParcel * _entries.length;
  double totalValueExits() => _valueParcel * _exits.length;
  double totalValue() => _valueParcel * _numberParcel;
  int numberEntriesAndExits() => (_exits.length + _entries.length);

  double totalValueEntriesOrExits() {
    return numberEntriesAndExits() * _valueParcel;
  }

  double totalValueWithoutEntriesOrExits() {
    return (_numberParcel - numberEntriesAndExits()) * _valueParcel;
  }

  void setNumberEntry(int number) {
    _entries = [];
    for (var _ = 1; _ <= number; _++) {
      _entries += [EntryHistory()];
    }
  }

  void setNumberExity(int number) {
    _exits = [];
    for (var _ = 1; _ <= number; _++) {
      _exits += [ExitHistory()];
    }
  }
}
