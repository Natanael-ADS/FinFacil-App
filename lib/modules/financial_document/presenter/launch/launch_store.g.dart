// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchStore on _LaunchStoreBase, Store {
  final _$totalPaidAtom = Atom(name: '_LaunchStoreBase.totalPaid');

  @override
  String get totalPaid {
    _$totalPaidAtom.reportRead();
    return super.totalPaid;
  }

  @override
  set totalPaid(String value) {
    _$totalPaidAtom.reportWrite(value, super.totalPaid, () {
      super.totalPaid = value;
    });
  }

  final _$totalPendingAtom = Atom(name: '_LaunchStoreBase.totalPending');

  @override
  String get totalPending {
    _$totalPendingAtom.reportRead();
    return super.totalPending;
  }

  @override
  set totalPending(String value) {
    _$totalPendingAtom.reportWrite(value, super.totalPending, () {
      super.totalPending = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_LaunchStoreBase.totalValue');

  @override
  String get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(String value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$showLaunchAtom = Atom(name: '_LaunchStoreBase.showLaunch');

  @override
  String get showLaunch {
    _$showLaunchAtom.reportRead();
    return super.showLaunch;
  }

  @override
  set showLaunch(String value) {
    _$showLaunchAtom.reportWrite(value, super.showLaunch, () {
      super.showLaunch = value;
    });
  }

  final _$_LaunchStoreBaseActionController =
      ActionController(name: '_LaunchStoreBase');

  @override
  void calculeTotal() {
    final _$actionInfo = _$_LaunchStoreBaseActionController.startAction(
        name: '_LaunchStoreBase.calculeTotal');
    try {
      return super.calculeTotal();
    } finally {
      _$_LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeLaunch(String type) {
    final _$actionInfo = _$_LaunchStoreBaseActionController.startAction(
        name: '_LaunchStoreBase.setTypeLaunch');
    try {
      return super.setTypeLaunch(type);
    } finally {
      _$_LaunchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPaid: ${totalPaid},
totalPending: ${totalPending},
totalValue: ${totalValue},
showLaunch: ${showLaunch}
    ''';
  }
}
