// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:lifttracker/product/model/exercise_model.dart';

/// workout model class for managing workout program
@HiveType(typeId: 0)
final class WorkoutModel {
  WorkoutModel({
    required this.workoutName,
    required this.exercises,
  });

  /// Workout's name
  @HiveField(0)
  final String workoutName;

  /// all the Exercises listed as order
  @HiveField(1)
  List<ExerciseModel> exercises;

  WorkoutModel copyWith({
    String? workoutName,
    List<ExerciseModel>? exercises,
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
      exercises: [],
    );
  }

  factory WorkoutModel.fromHiveMap(Map<dynamic, dynamic> map) {
    return WorkoutModel(
      workoutName: map['workoutName'] as String,
      exercises: List<ExerciseModel>.from(
        (map['exercises'] as List<dynamic>),
      ),
    );
  }
}

final class WorkoutModelAdapter extends TypeAdapter<WorkoutModel> {
  @override
  int get typeId => 0;

  @override
  WorkoutModel read(BinaryReader reader) {
    final map = reader.readMap();
    return WorkoutModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, WorkoutModel obj) {
    writer.writeMap(obj.toMap());
  }
}
