import 'package:lifttracker/product/model/exercise_model.dart';

/// workout model class for managing workout program
final class WorkoutModel {
  /// TODO: documentation
  WorkoutModel({required this.workoutName, required this.exercises});

  /// Workout's name
  final String workoutName;

  /// all the Exercises listed as order
  final Map<int, ExerciseModel> exercises;
}
