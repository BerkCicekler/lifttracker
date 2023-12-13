part of 'workout_program_editor_view.dart';

class WorkoutModelProvider extends ChangeNotifier {
  WorkoutModelProvider(this._workoutModel);

  final WorkoutModel _workoutModel;

  /// getter for workout model
  WorkoutModel get workoutModel => _workoutModel;

  void changeExercise({required int key, required ExerciseModel model}) {
    _workoutModel.exercises[key] = model;
  }

  void addExercise({required String exerciseName}) {
    _workoutModel.exercises[_workoutModel.exercises.length] = ExerciseModel(
      exerciseName: exerciseName,
      defaultSetCount: 1,
      defaultRepCount: 1,
      defaultWeightCount: 1,
    );
    notifyListeners();
  }
}
