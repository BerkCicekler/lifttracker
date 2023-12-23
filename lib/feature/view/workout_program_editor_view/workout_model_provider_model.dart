part of 'workout_program_editor_view.dart';

/// Workout model provider for managing state between widgets
final class WorkoutModelProvider extends ChangeNotifier {
  /// base constructor
  /// [_workoutId] Cache key value of saved workout model
  /// [_workoutModel] model will provide
  WorkoutModelProvider(this._workoutId, this._workoutModel) {
    _firstExerciseList = List.from(workoutModel.exercises);
  }

  /// The key id of the exercise saved in cache
  final int _workoutId;

  /// first workout model
  late final List<ExerciseModel> _firstExerciseList;

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
    _workoutModel.exercises.add(
      ExerciseModel(
        exerciseName: exerciseName,
        defaultSetCount: 1,
        defaultRepCount: 1,
        defaultWeightCount: 1.25,
      ),
    );
    notifyListeners();
  }

  void change2ExercisesIndex({
    required int firstIndex,
    required int secondIndex,
  }) {
    if (firstIndex < secondIndex) {
      secondIndex--;
    }

    final tile = _workoutModel.exercises.removeAt(firstIndex);

    _workoutModel.exercises.insert(secondIndex, tile);

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
