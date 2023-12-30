part of '../../workout_program_editor_view.dart';

/// operation for AllExercises column view widget
mixin AllExercisesColumnOperation on State<AllExercisesColumn> {
  //late Map<int, ExerciseModel> exercises;

  @override
  void initState() {
    super.initState();
    //exercises =
    //  Provider.of<WorkoutModelProvider>(context)._workoutModel.exercises;
  }

  /// This function will return the all exercises as
  /// EditExerciseDefaultsContainer List<widget>
  List<Widget> exercisesWidgets(List<ExerciseModel> exercises) {
    final widgetList = <Widget>[];

    for (var i = 0; i < exercises.length; i++) {
      widgetList.add(
        ListTile(
          contentPadding: EdgeInsets.zero,
          key: ValueKey(i),
          subtitle: EditExerciseDefaultsContainer(
            exerciseKeyId: i,
            exerciseModel: exercises[i],
          ),
        ),
      );
    }
    return widgetList;
  }

  void onDragDrop(int oldIndex, int newIndex) {
    Provider.of<WorkoutModelProvider>(
      context,
      listen: false,
    ).change2ExercisesIndex(
      firstIndex: oldIndex,
      secondIndex: newIndex,
    );
    setState(() {});
  }
}
