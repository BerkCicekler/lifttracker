part of '../../workout_programs_view.dart';

class WorkoutProgramsColumn extends StatelessWidget {
  const WorkoutProgramsColumn({required this.box, super.key});

  /// workout programs box
  final Box<dynamic> box;

  /// this function will return all the workout programs that user's created
  /// as a list of widgets created with CustomWorkoutContainer
  List<Widget> _workoutContainers() {
    final List<Widget> widgets = [];

    final Map<int, WorkoutModel> map = Map<int, WorkoutModel>.from(
      (box.toMap() as Map<dynamic, dynamic>),
    );

    for (final key in map.keys) {
      widgets.add(
        CustomWorkoutProgramContainer(
          actions: [
            ShowDeleteIconButtonView(
              workOutId: key,
            ),
          ],
          workoutModel: map[key]!,
        ),
      );
    }

    widgets.add(const CreateNewWorkoutContainer());

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _workoutContainers(),
    );
  }
}
