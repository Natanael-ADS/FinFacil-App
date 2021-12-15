import 'package:finfacil_app/modules/login/domain/entities/user.dart';

class UserModel extends User {
  int _id = 0;
  String _name = "";
  String _password = "";
  bool _logged = false;

  UserModel({int id, String name, String password, bool logged}) {
    this._id = id;
    this._name = name;
    this._password = password;
    this._logged = logged;
  }

  get id => this._id;
  set id(int value) => this._id = value;

  get name => this._name;
  set name(String value) => this._name = value;

  get password => this._password;
  set password(String value) => this.password = value;

  get logged => this._logged;
  set logged(bool value) => this._logged = value;

  User toUnity() {
    return User(
      id: this.id,
      name: this.name,
      password: this.password,
      logged: this.logged,
    );
  }
}
