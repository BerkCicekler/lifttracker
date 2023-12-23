part of '../../workout_program_editor_view.dart';

/// main Column for exercise editor view
final class AllExercisesColumn extends StatefulWidget {
  /// This the the fundamental column widget for
  /// Workout program editor view
  const AllExercisesColumn({super.key});

  @override
  State<AllExercisesColumn> createState() => _AllExercisesColumnState();
}

final class _AllExercisesColumnState extends State<AllExercisesColumn>
    with AllExercisesColumnOperation {
  @override
  Widget build(BuildContext context) {
    final exercises =
        Provider.of<WorkoutModelProvider>(context).workoutModel.exercises;
    print(exercises);
    print('build');
    return ReorderableListView(
      //TODO: sıralama sıkıntılı
      onReorder: onDragDrop,
      children: exercisesWidgets(exercises),
    );
  }
}
