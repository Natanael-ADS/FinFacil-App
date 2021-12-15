import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/domain/repositories/user_validate_repository.dart';
import 'package:finfacil_app/modules/login/infra/datasources/user_validate_datasource.dart';

class UserValidateRepositoryImpl implements UserValidateRepository {
  final UserValidateDatasource datasource;

  UserValidateRepositoryImpl(this.datasource);

  @override
  Future<List<User>> search(User user) async {
    final result = await datasource.searchLogin(user.getName());
    return result.map((e) => e.toUnity()).toList();
  }
}
