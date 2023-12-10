part of 'workout_program_editor_view.dart';

class WorkoutModelProvider extends ChangeNotifier {
  WorkoutModelProvider(this._workoutModel);

  final WorkoutModel _workoutModel;

  void changeExercise({required int key, required ExerciseModel model}) {
    _workoutModel.exercises[key] = model;
  }
}
