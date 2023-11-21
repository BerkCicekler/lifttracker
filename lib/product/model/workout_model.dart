// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:lifttracker/product/model/exercise_model.dart';

/// workout model class for managing workout program
@HiveType(typeId: 0)
final class WorkoutModel {
  /// TODO: documentation
  WorkoutModel({
    required this.workoutName,
    required this.exercises,
  });

  /// Workout's name
  @HiveField(0)
  final String workoutName;

  /// all the Exercises listed as order
  @HiveField(1)
  final Map<int, ExerciseModel> exercises;

  WorkoutModel copyWith({
    String? workoutName,
    Map<int, ExerciseModel>? exercises,
  }) {
    return WorkoutModel(
      workoutName: workoutName ?? this.workoutName,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workoutName': workoutName,
      'exercises': exercises,
    };
  }

  factory WorkoutModel.empty() {
    return WorkoutModel(
      workoutName: '',
      exercises: {},
    );
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      workoutName: map['workoutName'] as String,
      exercises: Map<int, ExerciseModel>.from(
        (map['exercises'] as Map<int, ExerciseModel>),
      ),
    );
  }

  factory WorkoutModel.fromHiveMap(Map<dynamic, dynamic> map) {
    return WorkoutModel(
      workoutName: map['workoutName'] as String,
      exercises: Map<int, ExerciseModel>.from(
        (map['exercises'] as Map<dynamic, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) =>
      WorkoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WorkoutModel(workoutName: $workoutName, exercises: $exercises)';
}

class WorkoutModelAdapter extends TypeAdapter<WorkoutModel> {
  @override
  int get typeId => 0;

  @override
  WorkoutModel read(BinaryReader reader) {
    Map<dynamic, dynamic> map = reader.readMap();
    return WorkoutModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, WorkoutModel obj) {
    writer.writeMap(obj.toMap());
  }
}
