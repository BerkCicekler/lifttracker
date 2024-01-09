part of '../../workout_program_editor_view.dart';

/// This is a customized app bar for workout program editor page
/// this app bar have contains save, share and add exercise feature
final class WorkoutProgramEditorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// This is a customized app bar for workout program editor page
  /// this app bar have contains save, share and add exercise feature
  const WorkoutProgramEditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutModelCubit = context.read<WorkoutModelCubit>();
    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        workoutModelCubit.state.workoutModel.workoutName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.restart),
          onPressed: () => workoutModelCubit.restoreDefaultTapped(context),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => workoutModelCubit.createNewExerciseTapped(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
