part of '../../workout_programs_view.dart';

/// workout program column for listing user's workout programs
final class WorkoutProgramsColumn extends StatelessWidget {
  /// this is a widget for listing user's workouts
  /// will list the user's all workouts with the delete and show action
  const WorkoutProgramsColumn({required this.box, super.key});

  /// workout programs box
  final Box<dynamic> box;

  Future<void> _createNewWorkoutProgram(BuildContext context) async {
    final respond = await TextInputDialog.show(
      context: context,
      title: 'Workout name',
      okText: 'general.ok'.tr(),
      cancelText: 'general.cancel'.tr(),
    );
    if (respond != null && respond.isNotEmpty) {
      await CacheManager.createWorkOutProgram(name: respond);
    }
  }

  /// this function will return all the workout programs that user's created
  /// as a list of widgets created with CustomWorkoutContainer
  List<Widget> _workoutContainers() {
    final widgets = <Widget>[];

    final map = Map<int, WorkoutModel>.from(
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

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ..._workoutContainers(),
        IntractableContainer(
          onTap: () => _createNewWorkoutProgram(context),
        ),
      ],
    );
  }
}
