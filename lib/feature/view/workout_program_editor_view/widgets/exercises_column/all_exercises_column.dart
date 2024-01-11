part of '../../workout_program_editor_view.dart';

/// main Column for exercise editor view
final class AllExercisesColumn extends StatelessWidget {
  /// This the the fundamental column widget for
  /// Workout program editor view
  const AllExercisesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutModelCubit, WorkoutModel>(
      builder: (context, state) {
        return ReorderableListView(
          //TODO: reorderableList working | (99.999% not cause of me)
          onReorder: (oldIndex, newIndex) =>
              context.read<WorkoutModelCubit>().change2ExercisesIndex(
                    firstIndex: oldIndex,
                    secondIndex: newIndex,
                  ),
          children: [
            for (var i = 0; i < state.exercises.length; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                key: ValueKey(i),
                subtitle: EditExerciseDefaultsContainer(
                  exerciseKeyId: i,
                  exerciseModel: state.exercises[i],
                ),
              ),
          ],
        );
      },
    );
  }
}
