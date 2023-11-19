// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

/// exercise set model
@HiveType(typeId: 2)
class SetModel {
  ///TODO: documentation
  SetModel({
    required this.weight,
    required this.reps,
    this.setType = '',
  });

  /// Weight of the set
  @HiveField(0)
  final String weight;

  /// rep count of the set
  @HiveField(1)
  final String reps;

  /// set finish type
  @HiveField(2)
  final String setType;

  SetModel copyWith({
    String? weight,
    String? reps,
    String? setType,
  }) {
    return SetModel(
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      setType: setType ?? this.setType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'reps': reps,
      'setType': setType,
    };
  }

  factory SetModel.fromMap(Map<String, dynamic> map) {
    return SetModel(
      weight: map['weight'] as String,
      reps: map['reps'] as String,
      setType: map['setType'] as String,
    );
  }

  factory SetModel.fromHiveMap(Map<dynamic, dynamic> map) {
    return SetModel(
      weight: map['weight'] as String,
      reps: map['reps'] as String,
      setType: map['setType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SetModel.fromJson(String source) =>
      SetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SetModel(weight: $weight, reps: $reps, setType: $setType)';

  @override
  bool operator ==(covariant SetModel other) {
    if (identical(this, other)) return true;

    return other.weight == weight &&
        other.reps == reps &&
        other.setType == setType;
  }

  @override
  int get hashCode => weight.hashCode ^ reps.hashCode ^ setType.hashCode;
}

class SetModelAdapter extends TypeAdapter<SetModel> {
  @override
  int get typeId => 2;

  @override
  SetModel read(BinaryReader reader) {
    Map<dynamic, dynamic> map = reader.readMap();
    return SetModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, SetModel obj) {
    writer.writeMap(obj.toMap());
  }
}
