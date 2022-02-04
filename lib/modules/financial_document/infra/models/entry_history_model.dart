import 'dart:convert';

import 'package:finfacil_app/modules/financial_document/domain/enities/entry_history.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/launch_type_model.dart';

class EntryHistoryModel {
  int id = 0;
  DateTime day = DateTime.now();
  LaunchTypeModel launch = LaunchTypeModel();

  EntryHistoryModel({
    this.id,
    this.day,
    this.launch,
  });

  EntryHistoryModel.fromUnity(EntryHistory history) {
    this.id = history.getId();
    this.day = history.getDay();
    final launch = history.getLaunch();
    this.launch = LaunchTypeModel(
      id: launch.getId(),
      description: launch.getDescription(),
    );
  }

  EntryHistory toUnity() {
    return EntryHistory(
        id: this.id, day: this.day, launch: this.launch?.toUnity());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day.millisecondsSinceEpoch,
      'launch': launch.toMap(),
    };
  }

  factory EntryHistoryModel.fromMap(Map<String, dynamic> map) {
    return EntryHistoryModel(
      id: map['id']?.toInt() ?? 0,
      day: DateTime.fromMillisecondsSinceEpoch(map['day']),
      launch: LaunchTypeModel.fromMap(map['launch']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EntryHistoryModel.fromJson(String source) {
    return EntryHistoryModel.fromMap(json.decode(source));
  }

  @override
  String toString() => 'HistoryTypeModel(id: $id, day: $day, launch: $launch)';
}
