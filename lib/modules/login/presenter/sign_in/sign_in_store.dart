import 'dart:async';

import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/status_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  @observable
  bool isVisibilityPassword = true;

  @action
  void setVisibilityPassword() => isVisibilityPassword = !isVisibilityPassword;

  final _usecase = Modular.get<UserValidateUsecase>();

  @action
  FutureOr<StatusLogin> loadingLogin({String name, String password}) async {
    var user = User(name: name, password: password);

    var result = await _usecase(user);

    return result;
  }
}
