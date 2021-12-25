import 'launch_type.dart';

class HistoryType {
  int _id = 0;
  DateTime _day = DateTime.now();
  LaunchType _launch = LaunchType();

  HistoryType(int id, DateTime day, LaunchType launch) {
    this._id = id;
    this._day = day;
    this._launch = launch;
  }

  get geId => this._id;
  set setId(value) => this._id = value;

  get geDay => this._day;
  set setDay(value) => this._day = value;

  get geLaunch => this._launch;
  set setLaunch(value) => this._launch = value;
}
