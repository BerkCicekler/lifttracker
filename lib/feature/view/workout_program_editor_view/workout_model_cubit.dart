// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'workout_program_editor_view.dart';

/// Cubit state management model for Workout program editor page
final class WorkoutModelCubit extends Cubit<WorkoutModelState> {
  /// base constructor
  /// [model] argument should be [WorkoutModelState] with the
  /// opened Workout
  WorkoutModelCubit(WorkoutModelState model) : super(model) {
    _firstExerciseList = List.from(model.workoutModel.exercises);
  }

  /// first workout model
  late final List<ExerciseModel> _firstExerciseList;

  WorkoutModel get _workoutModel => state.workoutModel;

  /// this function will change the given [model] exercise model
  /// on specified index in [_workoutModel]'s exercise map
  void changeExercise({required int key, required ExerciseModel model}) {
    _workoutModel.exercises[key] = model;
    emit(
      state.copyWith(
        workoutModel: _workoutModel,
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
    _workoutModel.exercises.add(
      ExerciseModel(
        exerciseName: exerciseName,
        defaultSetCount: 1,
        defaultRepCount: 1,
        defaultWeightCount: 1.25,
      ),
    );
    emit(
      state.copyWith(
        workoutModel: _workoutModel,
      ),
    );
  }

  /// This function will replace 2 exercises index's
  void change2ExercisesIndex({
    required int firstIndex,
    required int secondIndex,
  }) {
    if (firstIndex < secondIndex) {
      secondIndex--;
    }

    final tile = _workoutModel.exercises.removeAt(firstIndex);

    _workoutModel.exercises.insert(secondIndex, tile);

    emit(
      state.copyWith(
        workoutModel: _workoutModel,
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
        workoutModel: _workoutModel,
      ),
    );
  }
}

/// State holder for [WorkoutModelCubit]
final class WorkoutModelState extends Equatable {
  /// base constructor
  /// [workoutCacheId] Cache key value of saved workout model
  /// [workoutModel] model will provide
  const WorkoutModelState(this.workoutCacheId, this.workoutModel);

  /// The key id of the exercise saved in cache
  final int workoutCacheId;

  final WorkoutModel workoutModel;

  WorkoutModelState copyWith({
    int? workoutCacheId,
    WorkoutModel? workoutModel,
  }) {
    return WorkoutModelState(
      workoutCacheId ?? this.workoutCacheId,
      workoutModel ?? this.workoutModel,
    );
  }

  @override
  List<Object?> get props => [workoutCacheId, workoutModel];
}
