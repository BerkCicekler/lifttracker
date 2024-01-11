// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'workout_program_editor_view.dart';

/// Cubit state management model for Workout program editor page
final class WorkoutModelCubit extends Cubit<WorkoutModel> {
  /// base constructor
  /// [model] argument should be [WorkoutModelState] with the
  /// opened Workout
  WorkoutModelCubit({
    required WorkoutModel model,
  }) : super(model) {
    _firstExerciseList = List.from(model.exercises);
  }

  /// first workout model
  late final List<ExerciseModel> _firstExerciseList;

  WorkoutModel get _workoutModel => state;

  /// this function will change the given [model] exercise model
  /// on specified index in [state]'s exercise map
  void changeExercise({required int key, required ExerciseModel model}) {
    final tempExercises = state.exercises.toList();
    tempExercises[key] = model;
    emit(
      state.copyWith(
        exercises: tempExercises,
      ),
    );
  }

  Future<void> restoreDefaultTapped(BuildContext context) async {
    final response = await CustomActionDialog.show(
      context: context,
      title: 'Undo Changes',
      contextText: 'Are you sure you want to undo all changes ?',
      okText: 'Yes',
      cancelText: 'Cancel',
    );

    if (response) {
      _restoreDefault();
      await context.router.pop();
    }
  }

  Future<void> createNewExerciseTapped(BuildContext context) async {
    final nameOfExercise = await TextInputDialog.show(
      context: context,
      title: 'Exercise name',
      okText: 'Ok',
      cancelText: 'Cancel',
    );
    if (nameOfExercise != null && nameOfExercise.isNotEmpty) {
      addExercise(exerciseName: nameOfExercise);
    }
  }

  /// this function will add a new exercise on [_workoutModel],s exercise
  /// map with given [exerciseName]
  void addExercise({required String exerciseName}) {
    final tempExercises = state.exercises
      ..toList()
      ..add(
        ExerciseModel(
          exerciseName: exerciseName,
          defaultSetCount: 1,
          defaultRepCount: 1,
          defaultWeightCount: 1.25,
        ),
      );
    emit(
      state.copyWith(
        exercises: tempExercises,
      ),
    );
  }

  /// This function will replace 2 exercises index's
  void change2ExercisesIndex({
    required int firstIndex,
    required int secondIndex,
  }) {
    final tempExercises = state.exercises.toList();

    if (firstIndex < secondIndex) {
      secondIndex--;
    }

    final tile = tempExercises.removeAt(firstIndex);

    tempExercises.insert(secondIndex, tile);

    emit(
      state.copyWith(
        exercises: tempExercises,
      ),
    );
  }

  /// this function will restore [_workoutModel]'s exercises with
  /// first version of [_workoutModel]'s exercise which is stored in
  /// the [_firstExerciseList]
  void _restoreDefault() {
    _workoutModel.exercises.clear();
    _workoutModel.exercises.addAll(_firstExerciseList);
    emit(
      state.copyWith(
        exercises: _firstExerciseList,
      ),
    );
  }
}
