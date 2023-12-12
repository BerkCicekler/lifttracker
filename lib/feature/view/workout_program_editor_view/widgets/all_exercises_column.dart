part of '../workout_program_editor_view.dart';

class AllExercisesColumn extends StatelessWidget {
  const AllExercisesColumn({required this.exercisesMap, super.key});

  final Map<int, ExerciseModel> exercisesMap;

  List<Widget> _exercisesWidgets(Map<int, ExerciseModel> exercises) {
    List<Widget> widgetList = [];
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
