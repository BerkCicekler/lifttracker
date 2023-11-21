part of '../workout_program_editor_view.dart';

class WorkoutNotifier extends StateNotifier<WorkoutModel> {
  WorkoutNotifier() : super(WorkoutModel.empty());

  void setNewWorkout(WorkoutModel model) {
    state.copyWith(workoutName: model.workoutName, exercises: model.exercises);
  }

  void updateExercise({
    required int exerciseKeyId,
    required ExerciseModel model,
  }) {
    Map<int, ExerciseModel> copyMap = Map.from(state.exercises);
    copyMap[exerciseKeyId] = model;
    state.copyWith(exercises: copyMap);
  }
}
