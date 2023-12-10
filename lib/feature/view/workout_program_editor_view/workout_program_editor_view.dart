import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/widgets/edit_exercise_defaults_container/edit_exercise_defaults_container_mixin.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/custom_number_editor.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/exercise_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';
import 'package:provider/provider.dart';

part 'widgets/edit_exercise_defaults_container/edit_exercise_defaults_container.dart';
part 'widgets/all_exercises_column.dart';
part 'workout_model_provider_model.dart';

@RoutePage()
class WorkoutProgramEditorView extends StatefulWidget {
  /// its a workout program editor page for
  /// managing exercises
  /// [workoutModel] model that will be listed
  /// [workoutId] cache box index of the workout program
  /// on save action will be save the model on this index in cache
  const WorkoutProgramEditorView({
    required this.workoutModel,
    required this.workoutId,
    super.key,
  });

  /// the workout id index saved in cache
  final int workoutId;

  /// workout model that will be show
  final WorkoutModel workoutModel;

  @override
  State<WorkoutProgramEditorView> createState() =>
      _WorkoutProgramEditorViewState();
}

class _WorkoutProgramEditorViewState extends State<WorkoutProgramEditorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutModel.workoutName),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: ChangeNotifierProvider(
          create: (context) => WorkoutModelProvider(widget.workoutModel),
          child: AllExercisesColumn(
            exercisesMap: widget.workoutModel.exercises,
          ),
        ),
      ),
    );
  }
}
