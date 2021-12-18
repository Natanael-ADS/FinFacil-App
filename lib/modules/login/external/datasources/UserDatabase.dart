import 'package:finfacil_app/modules/login/infra/datasources/user_validate_datasource.dart';
import 'package:finfacil_app/modules/login/infra/models/user_model.dart';

class UserDatabase implements UserValidateDatasource {
  List<UserModel> userModels;

  UserDatabase() {
    userModels = [
      UserModel(id: 1, name: "admin", password: "admin", logged: false)
    ];
  }

  @override
  Future<List<UserModel>> searchLogin(String name) async {
    var usersLocal = <UserModel>[];
    for (UserModel user in userModels) {
      if (user.name.contains(name)) {
        usersLocal.add(user);
      }
    }
    return usersLocal;
  }
}
