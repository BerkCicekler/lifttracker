part of '../../workout_program_editor_view.dart';

class WorkoutProgramEditorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WorkoutProgramEditorAppBar({
    required this.workoutId,
    required this.workoutName,
    super.key,
  });

  final String workoutName;

  final int workoutId;

  Future<void> _createNewExercise(BuildContext context) async {
    final nameOfExercise = await TextInputDialog.show(
      context: context,
      title: 'Exercise name',
      okText: 'Ok',
      cancelText: 'Cancel',
    );
    if (nameOfExercise != null && nameOfExercise.isNotEmpty) {
      Provider.of<WorkoutModelProvider>(context, listen: false)
          .addExercise(exerciseName: nameOfExercise);
    }
  }

  void _shareThisWorkout() {}

  void _saveThisWorkout(BuildContext context) {
    final model =
        Provider.of<WorkoutModelProvider>(context, listen: false).workoutModel;
    HiveCacheManager.updateWorkOutProgram(index: workoutId, model: model);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(workoutName),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.share),
          onPressed: _shareThisWorkout,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _createNewExercise(context),
        ),
        IconButton(
          icon: const Icon(Icons.save_outlined),
          onPressed: () => _saveThisWorkout(context),
        ),
      ],
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
