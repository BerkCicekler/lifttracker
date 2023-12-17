part of 'workout_program_editor_view.dart';

class WorkoutModelProvider extends ChangeNotifier {
  WorkoutModelProvider(this._workoutId, this._workoutModel);

  /// The key id of the exercise saved in cache
  final int _workoutId;

  final WorkoutModel _workoutModel;

  /// For detecting if the user saved the model with last edits
  /// initial value is true because the initial program will
  /// be the un edited model
  bool _isModelSaved = true;

  /// For detecting if the user saved the model with last edits
  bool get isModelSaved => _isModelSaved;

  /// The key id of the exercise saved in cache
  int get workoutId => _workoutId;

  /// getter for workout model
  WorkoutModel get workoutModel => _workoutModel;

  void changeExercise({required int key, required ExerciseModel model}) {
    _workoutModel.exercises[key] = model;
    _isModelSaved = false;
  }

  void addExercise({required String exerciseName}) {
    _workoutModel.exercises[_workoutModel.exercises.length + 1] = ExerciseModel(
      exerciseName: exerciseName,
      defaultSetCount: 1,
      defaultRepCount: 1,
      defaultWeightCount: 1,
    );
    _isModelSaved = false;
    notifyListeners();
  }
}
