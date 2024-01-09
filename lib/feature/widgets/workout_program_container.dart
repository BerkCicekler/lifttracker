import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/workout_model.dart';

///
final class CustomWorkoutProgramContainer extends StatelessWidget {
  /// this is a customize able container for displaying the workouts
  /// [actions] the Widgets show on the right side of the container
  /// [workoutModel] Workout model that will be base of this widget
  const CustomWorkoutProgramContainer({
    required this.actions,
    required this.workoutModel,
    super.key,
  });

  /// the user actions shows up on the right side of the container
  final List<Widget> actions;

  /// Workout model that will be base of this widget
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    num setCount = 0;
    final exerciseCount = workoutModel.exercises.length.toString();

    for (final exercise in workoutModel.exercises) {
      setCount += exercise.defaultSetCount;
    }

    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 100,
      padding: EdgeInsets.all(PaddingConstants.small.value),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ColorConstants.containerGrey,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workoutModel.workoutName,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoBlack',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'workoutProgram.exerciseCount'.tr(args: [exerciseCount]),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'workoutProgram.setCount'.tr(args: [setCount.toString()]),
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
