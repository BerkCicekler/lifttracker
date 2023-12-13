part of '../workout_program_editor_view.dart';

/// main Column for exercise editor view
class AllExercisesColumn extends StatelessWidget {
  /// This the the fundamental column widget for
  /// Workout program editor view
  /// [exercisesMap] exercise Map should be passed as
  /// Map<int, ExerciseModel>
  const AllExercisesColumn({required this.exercisesMap, super.key});

  /// the exercisesMap will show in screen
  final Map<int, ExerciseModel> exercisesMap;

  /// This function will return the all exercises as
  /// EditExerciseDefaultsContainer List<widget>
  List<Widget> _exercisesWidgets(Map<int, ExerciseModel> exercises) {
    final widgetList = <Widget>[];
    for (final key in exercises.keys) {
      widgetList.add(
        EditExerciseDefaultsContainer(
          exerciseKeyId: key,
          exerciseModel: exercises[key]!,
        ),
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WorkoutModelProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: _exercisesWidgets(exercisesMap),
      ),
    );
  }
}
