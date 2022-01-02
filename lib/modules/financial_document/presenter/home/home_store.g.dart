// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$dateCurrentAtom = Atom(name: '_HomeStoreBase.dateCurrent');

  @override
  DateTime get dateCurrent {
    _$dateCurrentAtom.reportRead();
    return super.dateCurrent;
  }

  @override
  set dateCurrent(DateTime value) {
    _$dateCurrentAtom.reportWrite(value, super.dateCurrent, () {
      super.dateCurrent = value;
    });
  }

  final _$statusAtom = Atom(name: '_HomeStoreBase.status');

  @override
  StatusFinancial get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StatusFinancial value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void nextDate(BuildContext context) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.nextDate');
    try {
      return super.nextDate(context);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousDate(BuildContext context) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.previousDate');
    try {
      return super.previousDate(context);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateCurrent: ${dateCurrent},
status: ${status}
    ''';
  }
}
