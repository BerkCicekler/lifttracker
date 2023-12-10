import 'package:flutter/widgets.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';
import 'package:lifttracker/product/model/exercise_model.dart';
import 'package:provider/provider.dart';

mixin EditExerciseDefaultsContainerOperation
    on State<EditExerciseDefaultsContainer> {
  late TextEditingController exerciseNameController;

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

  void onValueChange({required String changeType, required double value}) {
    final valueInt = value.toInt();
    switch (changeType) {
      case 'rep':
        currentExerciseModel.copyWith(defaultRepCount: valueInt);
      case 'set':
        currentExerciseModel.copyWith(defaultSetCount: valueInt);
      case 'weight':
        currentExerciseModel.copyWith(defaultWeightCount: value);
      default:
    }
  }

  void _save() {
    final newModel = widget.exerciseModel.copyWith();

    Provider.of<WorkoutModelProvider>(context)
        .changeExercise(key: widget.exerciseKeyId, model: newModel);
    print('save');
  }
}
