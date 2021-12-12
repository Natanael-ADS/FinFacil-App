class User {
  int _id = 0;
  String _name = "";
  String _password = "";
  bool _logged = false;

  User({int id, String name, String password, bool logged}) {
    this._id = id;
    this._name = name;
    this._password = password;
    this._logged = logged;
  }

  int getId() => this._id;
  User setId(int value) {
    this._id = value;
    return this;
  }

  String getName() => this._name;
  User setName(String value) {
    this._name = value;
    return this;
  }

  String getPassword() => this._password;
  User setPassword(String value) {
    this._password = value;
    return this;
  }

  bool isLogged() => this._logged;
  User setLogged(bool value) {
    this._logged = value;
    return this;
  }
}
