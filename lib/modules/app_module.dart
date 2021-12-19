import 'package:finfacil_app/modules/login/domain/repositories/user_validate_repository.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/external/datasources/UserDatabase.dart';
import 'package:finfacil_app/modules/login/infra/datasources/user_validate_datasource.dart';
import 'package:finfacil_app/modules/login/infra/repositories/user_validate_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login/presenter/sign_in/sign_in_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory<UserValidateDatasource>((i) {
        return UserDatabase();
      }),
      Bind.factory<UserValidateRepository>((i) {
        return UserValidateRepositoryImpl(i());
      }),
      Bind.factory<UserValidateUsecase>((i) {
        return UserValidateUseCaseImpl(i());
      })
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => LoginPage()),
    ];
  }
}
