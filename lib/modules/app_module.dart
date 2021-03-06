import 'package:finfacil_app/modules/core/const/route_const.dart';
import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/add_document.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/get_documents.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/remove_historic.dart';
import 'package:finfacil_app/modules/financial_document/domain/usecases/search_entry_and_exit.dart';
import 'package:finfacil_app/modules/financial_document/external/datasources/financial_document_database.dart';
import 'package:finfacil_app/modules/financial_document/external/datasources/historic_database.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/add_document_repository_impl.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/remove_historic_repository_impl.dart';
import 'package:finfacil_app/modules/financial_document/infra/repositories/search_financial_repository_impl.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_page.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/external/datasources/UserDatabase.dart';
import 'package:finfacil_app/modules/login/infra/repositories/user_validate_repository_impl.dart';
import 'package:finfacil_app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'financial_document/presenter/launch/launch_page.dart';
import 'login/presenter/sign_in/sign_in_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => DatabaseMock()),
      Bind.factory((i) => UserDatabase(i())),
      Bind.factory((i) => UserValidateRepositoryImpl(i())),
      Bind.factory((i) => UserValidateUseCaseImpl(i())),
      Bind.factory((i) => SearchEntryAndExitImpl(i())),
      Bind.factory((i) => SearchFinancialRepositoryImpl(i())),
      Bind.factory((i) => FinancialDocumentDataBase(i())),
      Bind.factory((i) => AddDocumentImpl(i())),
      Bind.factory((i) => AddDocumentRepositoryImpl(i())),
      Bind.factory((i) => GetDocumentsImpl(i())),
      Bind.factory((i) => RemoveHistoricImpl(i())),
      Bind.factory((i) => RemoveHistoricRepositoryImpl(i())),
      Bind.factory((i) => HistoricDataBase(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(RouteConst.SPLASH, child: (context, args) => SplashPage()),
      ChildRoute(RouteConst.LOGIN, child: (context, args) => LoginPage()),
      ChildRoute(RouteConst.HOME, child: (context, args) => HomePage()),
      ChildRoute(RouteConst.LAUNCH_KEY, child: (context, args) {
        return LaunchPage(args.params[RouteConst.KEY]);
      })
    ];
  }
}
