// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  final _$isVisibilityPasswordAtom =
      Atom(name: '_SignInStoreBase.isVisibilityPassword');

  @override
  bool get isVisibilityPassword {
    _$isVisibilityPasswordAtom.reportRead();
    return super.isVisibilityPassword;
  }

  @override
  set isVisibilityPassword(bool value) {
    _$isVisibilityPasswordAtom.reportWrite(value, super.isVisibilityPassword,
        () {
      super.isVisibilityPassword = value;
    });
  }

  final _$loadingLoginAsyncAction =
      AsyncAction('_SignInStoreBase.loadingLogin');

  @override
  Future<StatusLogin> loadingLogin({String name, String password}) {
    return _$loadingLoginAsyncAction
        .run(() => super.loadingLogin(name: name, password: password));
  }

  final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase');

  @override
  void setVisibilityPassword() {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setVisibilityPassword');
    try {
      return super.setVisibilityPassword();
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisibilityPassword: ${isVisibilityPassword}
    ''';
  }
}
