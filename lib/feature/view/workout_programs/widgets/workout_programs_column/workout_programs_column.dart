part of '../../workout_programs_view.dart';

/// workout program column for listing user's workout programs
class WorkoutProgramsColumn extends StatelessWidget {
  /// this is a widget for listing user's workouts
  /// will list the user's all workouts with the delete and show action
  const WorkoutProgramsColumn({required this.box, super.key});

  /// workout programs box
  final Box<dynamic> box;

  /// this function will return all the workout programs that user's created
  /// as a list of widgets created with CustomWorkoutContainer
  List<Widget> _workoutContainers() {
    final List<Widget> widgets = [];

    final Map<int, WorkoutModel> map = Map<int, WorkoutModel>.from(
      box.toMap(),
    );

    for (final key in map.keys) {
      widgets
        ..add(
          CustomWorkoutProgramContainer(
            actions: [
              ShowDeleteIconButtonView(
                workoutId: key,
                workoutModel: map[key]!,
              ),
            ],
            workoutModel: map[key]!,
          ),
        )
        ..add(
          const SizedBox(
            height: 8,
          ),
        );
    }

    widgets.add(const CreateNewWorkoutContainer());

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _workoutContainers(),
    );
  }
}
