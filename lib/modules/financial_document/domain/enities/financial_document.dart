import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';

import 'exit_history.dart';

class FinancialDocument {
  int _id = 0;
  String _description = '';
  double _valueTotal = 0.00;
  DateTime _dueDate = DateTime.now();
  double _valueParcel = 0.00;
  int _numberParcel = 0;
  List<EntryHistory> _entries = <EntryHistory>[];
  List<ExitHistory> _exits = <ExitHistory>[];

  FinancialDocument();

  int getId() => this._id;
  void setId(int value) => this._id = value;

  String getDescription() => this._description;
  void setDescription(String value) => this._description = value;

  double getValueTotal() => this._valueTotal;
  void setValueTotal(double value) => this._valueTotal = value;

  DateTime getDueDate() => this._dueDate;
  void setDueDate(DateTime value) => this._dueDate = value;

  double getValueParcel() => this._valueParcel;
  void setValueParcel(double value) => this._valueParcel = value;

  int getNumberParcel() => this._numberParcel;
  void setNumberParcel(int value) => this._numberParcel = value;

  List<EntryHistory> getEntries() => this._entries;
  void setEntries(List<EntryHistory> value) => this._entries = value;

  List<ExitHistory> getExits() => this._exits;
  void setExits(List<ExitHistory> value) => this._exits = value;

  double totalValueEntries() => this._valueParcel * this._entries.length;
  double totalValueExits() => this._valueParcel * this._exits.length;
}
