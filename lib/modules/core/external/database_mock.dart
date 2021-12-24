import 'package:finfacil_app/modules/login/infra/models/user_model.dart';

class DatabaseMock {
  List<UserModel> _userModels;

  DatabaseMock() {
    _userModels = _initUserModels();
  }

  List<UserModel> get getUsers => _userModels;
  set setUser(UserModel user) => _userModels.add(user);

  List<UserModel> _initUserModels() {
    return [
      UserModel(id: 1, name: "admin", password: "admin", logged: false),
    ];
  }
}
