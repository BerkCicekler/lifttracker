import 'package:flutter/widgets.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';
import 'package:widgets/custom_action_dialog/custom_action_dialog.dart';

mixin WorkoutProgramEditorOperation on State<WorkoutProgramEditorView> {
  late WorkoutModelProvider workoutModelProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutModelProvider = WorkoutModelProvider(
      widget.workoutId,
      widget.workoutModel,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    workoutModelProvider.dispose();
  }

  void onPopInvoked(BuildContext context) async {
    if (true) {
      final responde = await CustomActionDialog.show(
        context: context,
        title: 'Not Saved',
        contextText:
            "You didn't saved your changes yet are you sure you want to leave the page",
        okText: 'Yes',
        cancelText: 'Cancel',
      );
      if (responde == true) return Navigator.pop(context);
    }
    Navigator.pop(context);
  }
}
