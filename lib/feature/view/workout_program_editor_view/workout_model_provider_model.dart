part of 'workout_program_editor_view.dart';

/// Workout model provider for managing state between widgets
class WorkoutModelProvider extends ChangeNotifier {
  /// base constructor
  /// [_workoutId] Cache key value of saved workout model
  /// [_workoutModel] model will provide
  WorkoutModelProvider(this._workoutId, this._workoutModel) {
    _firstExerciseList = Map.from(workoutModel.exercises);
  }

  /// The key id of the exercise saved in cache
  final int _workoutId;

  /// first workout model
  late final Map<int, ExerciseModel> _firstExerciseList;

  final WorkoutModel _workoutModel;

  /// The key id of the exercise saved in cache
  int get workoutId => _workoutId;

  /// getter for workout model
  WorkoutModel get workoutModel => _workoutModel;

  /// this function will change the given [model] exercise model
  /// on specified index in [_workoutModel]'s exercise map
  void changeExercise({required int key, required ExerciseModel model}) {
    _workoutModel.exercises[key] = model;
  }

  /// this function will add a new exercise on [_workoutModel],s exercise
  /// map with given [exerciseName]
  void addExercise({required String exerciseName}) {
    _workoutModel.exercises[_workoutModel.exercises.length] = ExerciseModel(
      exerciseName: exerciseName,
      defaultSetCount: 1,
      defaultRepCount: 1,
      defaultWeightCount: 1.25,
    );
    notifyListeners();
  }

  void change2ExercisesIndex({
    required int firstIndex,
    required int secondIndex,
  }) {
    final temp = _workoutModel.exercises[firstIndex];
    final tempSecond = _workoutModel.exercises[secondIndex];
    _workoutModel.exercises[secondIndex] =
        temp!; // first index can't be null because its the one who dragged
    if (tempSecond != null) {
      _workoutModel.exercises[firstIndex] = tempSecond;
    } else {
      _workoutModel.exercises.removeWhere((key, value) => key == firstIndex);
    }
    notifyListeners();
  }

  /// this function will restore [_workoutModel]'s exercises with
  /// first version of [_workoutModel]'s exercise which is stored in
  /// the [_firstExerciseList]
  void restoreDefault() {
    _workoutModel.exercises.clear();
    _workoutModel.exercises.addAll(_firstExerciseList);

    notifyListeners();
  }
}
