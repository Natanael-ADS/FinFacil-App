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

  getId() => this._id;
  void setId(int value) => this._id = value;

  getDay() => this._day;
  void setDay(DateTime value) => this._day = value;

  getLaunch() => this._launch;
  void setLaunch(LaunchType value) => this._launch = value;
}
