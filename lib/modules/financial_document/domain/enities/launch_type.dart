class LaunchType {
  int _id = 0;
  String _description = '';

  LaunchType({int id, String description}) {
    this._id = id;
    this._description = description;
  }

  getId() => this._id;
  void setId(int value) => this._id = value;

  getDescription() => this._description;
  void setDescription(String value) => this._description = value;
}
