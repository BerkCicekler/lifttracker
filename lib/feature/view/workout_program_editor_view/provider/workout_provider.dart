part of '../workout_program_editor_view.dart';

final workoutProvider = StateNotifierProvider<WorkoutNotifier, WorkoutModel>(
  (ref) => WorkoutNotifier(),
);
