import 'launch_type.dart';

class HistoryType {
  int _id;
  DateTime _day;
  LaunchType _launch;

  HistoryType(int id, DateTime day, LaunchType launch) {
    this._id = id ?? 0;
    this._day = day ?? DateTime.now();
    this._launch = launch ?? LaunchType();
  }

  int getId() => this._id;
  void setId(int value) => this._id = value;

  DateTime getDay() => this._day;
  void setDay(DateTime value) => this._day = value;

  LaunchType getLaunch() => this._launch;
  void setLaunch(LaunchType value) => this._launch = value;
}
