// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

/// exercise set model
@HiveType(typeId: 2)
final class SetModel {
  SetModel({
    required this.weight,
    required this.reps,
    this.setType = '',
  });

  /// Weight of the set
  @HiveField(0)
  final double weight;

  /// rep count of the set
  @HiveField(1)
  final int reps;

  /// set finish type
  @HiveField(2)
  final String setType;

  SetModel copyWith({
    double? weight,
    int? reps,
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

  factory SetModel.fromHiveMap(Map<dynamic, dynamic> map) {
    return SetModel(
      weight: map['weight'] as double,
      reps: map['reps'] as int,
      setType: map['setType'] as String,
    );
  }
}

final class SetModelAdapter extends TypeAdapter<SetModel> {
  @override
  int get typeId => 2;

  @override
  SetModel read(BinaryReader reader) {
    final map = reader.readMap();
    return SetModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, SetModel obj) {
    writer.writeMap(obj.toMap());
  }
}
