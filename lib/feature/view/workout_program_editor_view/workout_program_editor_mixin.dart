import 'package:flutter/widgets.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';

/// Operation mixin for [WorkoutProgramEditorView] page
mixin WorkoutProgramEditorOperation on State<WorkoutProgramEditorView> {
  /// for providing and managing the workout model
  late final WorkoutModelProvider workoutModelProvider;

  @override
  void initState() {
    super.initState();
    workoutModelProvider = WorkoutModelProvider(
      widget.workoutId,
      widget.workoutModel,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _save();
  }

  void _save() {
    CacheManager.updateWorkOutProgram(
      index: workoutModelProvider.workoutId,
      model: workoutModelProvider.workoutModel,
    );
  }
}
