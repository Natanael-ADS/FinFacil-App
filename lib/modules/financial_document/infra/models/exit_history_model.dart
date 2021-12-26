import 'dart:convert';

import 'package:finfacil_app/modules/financial_document/domain/enities/exit_history.dart';

import 'launch_type_model.dart';

class ExitHistoryModel {
  int id = 0;
  DateTime day = DateTime.now();
  LaunchTypeModel launch = LaunchTypeModel();

  ExitHistoryModel({
    this.id,
    this.day,
    this.launch,
  });

  ExitHistory toUnity() {
    return ExitHistory(
        id: this.id, day: this.day, launch: this.launch.toUnity());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day.millisecondsSinceEpoch,
      'launch': launch.toMap(),
    };
  }

  factory ExitHistoryModel.fromMap(Map<String, dynamic> map) {
    return ExitHistoryModel(
      id: map['id']?.toInt() ?? 0,
      day: DateTime.fromMillisecondsSinceEpoch(map['day']),
      launch: LaunchTypeModel.fromMap(map['launch']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExitHistoryModel.fromJson(String source) {
    return ExitHistoryModel.fromMap(json.decode(source));
  }

  @override
  String toString() => 'HistoryTypeModel(id: $id, day: $day, launch: $launch)';
}
