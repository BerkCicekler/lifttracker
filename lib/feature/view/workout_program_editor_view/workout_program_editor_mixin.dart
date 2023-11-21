import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';

mixin WorkoutProgramEditorOperation on ConsumerState<WorkoutProgramEditorView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(workoutProvider.notifier).setNewWorkout(widget.workoutModel);
  }
}
