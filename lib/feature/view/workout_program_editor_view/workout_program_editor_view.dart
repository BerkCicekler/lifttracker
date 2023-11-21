import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/exercise_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';

part 'widgets/edit_exercise_defaults_container.dart';
part 'widgets/all_exercises_column.dart';
part 'provider/workout_notifier.dart';
part 'provider/workout_provider.dart';

@RoutePage()
class WorkoutProgramEditorView extends ConsumerStatefulWidget {
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
  ConsumerState<WorkoutProgramEditorView> createState() =>
      _WorkoutProgramEditorViewState();
}

class _WorkoutProgramEditorViewState
    extends ConsumerState<WorkoutProgramEditorView> {
  @override
  Widget build(BuildContext context) {
    final WorkoutModel model = ref.watch(workoutProvider);
    for (final element in model.exercises.keys) {
      print(model.exercises[element]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(model.workoutName),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: AllExercisesColumn(exercisesMap: model.exercises),
      ),
    );
  }
}
