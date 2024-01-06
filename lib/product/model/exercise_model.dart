// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

import 'package:lifttracker/product/model/set_model.dart';

/// Exercise model class for exercise data
@HiveType(typeId: 1)
final class ExerciseModel {
  /// Exercise model constructor for just 1 movement
  ExerciseModel({
    required this.exerciseName,
    required this.defaultSetCount,
    required this.defaultRepCount,
    required this.defaultWeightCount,
  }) {
    for (var setNumber = 0; setNumber == defaultSetCount; setNumber++) {
      exerciseSets[setNumber] = SetModel(
        weight: defaultWeightCount,
        reps: defaultRepCount,
      );
    }
  }

  /// Exercise's name
  @HiveField(0)
  final String exerciseName;

  /// The default set count value will create all the sets automatic
  @HiveField(1)
  final int defaultSetCount;

  /// The default rep count value will set
  /// the rep values of all sets to this value
  @HiveField(2)
  final int defaultRepCount;

  /// The default weight count value will set
  /// the weight values of all sets to this value
  @HiveField(3)
  final double defaultWeightCount;

  /// default exercise creation will be in constructor method
  /// this is will work for saving user's exercise
  @HiveField(4)
  late Map<int, SetModel> exerciseSets;

  ExerciseModel copyWith({
    String? exerciseName,
    int? defaultSetCount,
    int? defaultRepCount,
    double? defaultWeightCount,
  }) {
    return ExerciseModel(
      exerciseName: exerciseName ?? this.exerciseName,
      defaultSetCount: defaultSetCount ?? this.defaultSetCount,
      defaultRepCount: defaultRepCount ?? this.defaultRepCount,
      defaultWeightCount: defaultWeightCount ?? this.defaultWeightCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exerciseName': exerciseName,
      'defaultSetCount': defaultSetCount,
      'defaultRepCount': defaultRepCount,
      'defaultWeightCount': defaultWeightCount,
    };
  }

  factory ExerciseModel.fromHiveMap(Map<dynamic, dynamic> map) {
    return ExerciseModel(
      exerciseName: map['exerciseName'] as String,
      defaultSetCount: map['defaultSetCount'] as int,
      defaultRepCount: map['defaultRepCount'] as int,
      defaultWeightCount: map['defaultWeightCount'] as double,
    );
  }
}

final class ExerciseModelAdapter extends TypeAdapter<ExerciseModel> {
  @override
  int get typeId => 1;

  @override
  ExerciseModel read(BinaryReader reader) {
    final map = reader.readMap();
    return ExerciseModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, ExerciseModel obj) {
    writer.writeMap(obj.toMap());
  }
}
