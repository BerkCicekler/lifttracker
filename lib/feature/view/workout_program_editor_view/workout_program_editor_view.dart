import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/widgets/edit_exercise_defaults_container/edit_exercise_defaults_container_mixin.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_mixin.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/custom_number_editor.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/exercise_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';
import 'package:provider/provider.dart';
import 'package:widgets/custom_action_dialog/custom_action_dialog.dart';
import 'package:widgets/text_input_dialog/text_input_dialog.dart';

part 'widgets/exercises_column/all_exercises_column.dart';
part 'widgets/exercises_column/all_exercises_column_mixin.dart';
part 'widgets/app_bar/app_bar.dart';
part 'widgets/edit_exercise_defaults_container/edit_exercise_defaults_container.dart';
part 'workout_model_provider_model.dart';

@RoutePage()
final class WorkoutProgramEditorView extends StatefulWidget {
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

class _WorkoutProgramEditorViewState extends State<WorkoutProgramEditorView>
    with WorkoutProgramEditorOperation {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => workoutModelProvider,
      child: const _WorkoutProgramEditorBody(),
    );
  }
}

class _WorkoutProgramEditorBody extends StatelessWidget {
  const _WorkoutProgramEditorBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WorkoutProgramEditorAppBar(),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: const AllExercisesColumn(),
      ),
    );
  }
}
