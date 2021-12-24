import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/external/datasources/UserDatabase.dart';
import 'package:finfacil_app/modules/login/infra/repositories/user_validate_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login/presenter/sign_in/sign_in_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => DatabaseMock()),
      Bind.factory((i) => UserDatabase(i())),
      Bind.factory((i) => UserValidateRepositoryImpl(i())),
      Bind.factory((i) => UserValidateUseCaseImpl(i()))
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => LoginPage()),
    ];
  }
}
