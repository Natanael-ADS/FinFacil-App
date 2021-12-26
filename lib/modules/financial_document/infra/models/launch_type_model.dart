import 'dart:convert';

import 'package:finfacil_app/modules/financial_document/domain/enities/launch_type.dart';

class LaunchTypeModel {
  int id = 0;
  String description = '';
  LaunchTypeModel();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  LaunchType toUnity() {
    final unity = LaunchType();

    unity.setId(this.id);
    unity.setDescription(this.description);

    return unity;
  }

  factory LaunchTypeModel.fromMap(Map<String, dynamic> map) {
    final model = LaunchTypeModel();

    model.id = map['id']?.toInt() ?? 0;
    model.description = map['description'] ?? '';

    return model;
  }

  String toJson() => json.encode(toMap());

  factory LaunchTypeModel.fromJson(String source) =>
      LaunchTypeModel.fromMap(json.decode(source));

  @override
  String toString() => 'LaunchTypeModel(id: $id, description: $description)';
}
