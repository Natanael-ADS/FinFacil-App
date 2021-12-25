class LaunchType {
  int _id = 0;
  String _description = '';

  LaunchType({int id, String description}) {
    this._id = id;
    this._description = description;
  }

  get geId => this._id;
  set setId(value) => this._id = value;

  get geDescription => this._description;
  set setDescription(value) => this._description = value;
}
