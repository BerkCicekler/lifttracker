part of '../../workout_program_editor_view.dart';

/// This is a customized app bar for workout program editor page
/// this app bar have contains save, share and add exercise feature
final class WorkoutProgramEditorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// This is a customized app bar for workout program editor page
  /// this app bar have contains save, share and add exercise feature
  const WorkoutProgramEditorAppBar({super.key});

  Future<void> _createNewExercise(BuildContext context) async {
    final nameOfExercise = await TextInputDialog.show(
      context: context,
      title: 'Exercise name',
      okText: 'Ok',
      cancelText: 'Cancel',
    );
    if (nameOfExercise != null && nameOfExercise.isNotEmpty) {
      Provider.of<WorkoutModelProvider>(
        context,
        listen: false,
      ).addExercise(exerciseName: nameOfExercise);
    }
  }

  Future<void> _restoreAllChanges(BuildContext context) async {
    final respond = await CustomActionDialog.show(
      context: context,
      title: 'Undo Changes',
      contextText: 'Are you sure you want to undo all changes ?',
      okText: 'Yes',
      cancelText: 'Cancel',
    );

    if (respond) {
      Provider.of<WorkoutModelProvider>(
        context,
        listen: false,
      ).restoreDefault();
      await context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final workoutProviderModel = Provider.of<WorkoutModelProvider>(
      context,
      listen: false,
    );
    return AppBar(
      title: Text(workoutProviderModel.workoutModel.workoutName),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.restart),
          onPressed: () => _restoreAllChanges(context),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _createNewExercise(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
