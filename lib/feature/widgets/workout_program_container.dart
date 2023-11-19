import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/workout_model.dart';

///
final class CustomWorkoutProgramContainer extends StatelessWidget {
  /// this is a customize able container for displaying the workouts
  /// [actions] the Widgets show on the right side of the container
  /// [workoutModel] Workout model that will be base of this widget
  CustomWorkoutProgramContainer({
    required this.actions,
    required this.workoutModel,
    super.key,
  });

  /// the user actions shows up on the right side of the container
  final List<Widget> actions;

  /// Workout model that will be base of this widget
  final WorkoutModel workoutModel;

  late String _exerciseCount;

  late String _repCount;

  void _calculateCounts() {
    num repCountI = 0;
    _exerciseCount = workoutModel.exercises.length.toString();
    for (final key in workoutModel.exercises.keys) {
      repCountI += workoutModel.exercises[key]!.defaultRepCount;
    }
    _repCount = repCountI.toString();
  }

  @override
  Widget build(BuildContext context) {
    _calculateCounts();
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 100,
      padding: EdgeInsets.all(PaddingConstants.small.value),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFF33363b),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workoutModel.workoutName,
                style: const TextStyle(fontSize: 22, fontFamily: 'RobotoBlack'),
              ),
              Text(
                'workoutProgram.exerciseCount'.tr(args: [_exerciseCount]),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'workoutProgram.repCount'.tr(args: [_repCount]),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          ...actions,
        ],
      ),
    );
  }
}
