part of '../../workout_program_editor_view.dart';

/// main Column for exercise editor view
class AllExercisesColumn extends StatefulWidget {
  /// This the the fundamental column widget for
  /// Workout program editor view
  /// [exercisesMap] exercise Map should be passed as
  /// Map<int, ExerciseModel>
  const AllExercisesColumn({required this.exercisesMap, super.key});

  /// the exercisesMap will show in screen
  final Map<int, ExerciseModel> exercisesMap;

  @override
  State<AllExercisesColumn> createState() => _AllExercisesColumnState();
}

class _AllExercisesColumnState extends State<AllExercisesColumn>
    with AllExercisesColumnOperation {
  @override
  Widget build(BuildContext context) {
    final exercises =
        Provider.of<WorkoutModelProvider>(context).workoutModel.exercises;
    print('build');
    return ReorderableListView(
      onReorder: onDragDrop,
      children: exercisesWidgets(exercises),
    );
  }
}
