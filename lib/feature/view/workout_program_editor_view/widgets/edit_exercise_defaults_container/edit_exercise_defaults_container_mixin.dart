import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';
import 'package:lifttracker/product/model/exercise_model.dart';

/// Exercise editor container's operation mixin
/// for handling state and functions
mixin EditExerciseDefaultsContainerOperation
    on State<EditExerciseDefaultsContainer> {
  /// exercise Name textfield's controller
  late final TextEditingController exerciseNameController;

  /// the current value of the exerciseModel
  /// is store here
  late ExerciseModel currentExerciseModel;

  @override
  void initState() {
    super.initState();
    exerciseNameController = TextEditingController();
    currentExerciseModel = widget.exerciseModel.copyWith();
    exerciseNameController.text = widget.exerciseModel.exerciseName;
  }

  @override
  void dispose() {
    super.dispose();
    exerciseNameController.dispose();
  }

  /// This function will execute when a user change in exercise model
  /// and will save the change in workout model provider
  void onValueChange({required String changeType, required double value}) {
    final valueInt = value.toInt();
    switch (changeType) {
      case 'rep':
        currentExerciseModel =
            currentExerciseModel.copyWith(defaultRepCount: valueInt);
      case 'set':
        currentExerciseModel =
            currentExerciseModel.copyWith(defaultSetCount: valueInt);
      case 'weight':
        currentExerciseModel =
            currentExerciseModel.copyWith(defaultWeightCount: value);
      default:
        // unexpected
        return;
    }
    _save();
  }

  void _save() {
    // new exercise model
    final newModel = currentExerciseModel.copyWith();

    context.read<WorkoutModelCubit>().changeExercise(
          key: widget.exerciseKeyId,
          model: newModel,
        );
  }
}
