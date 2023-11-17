import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

///
class CustomWorkoutProgramContainer extends StatelessWidget {
  /// this is a customize able container for displaying the workouts
  /// [actions] the Widgets show on the right side of the container
  /// [exerciseCount] total exercise count of workout program
  /// [repCount] total rep count of the workout program
  const CustomWorkoutProgramContainer({
    required this.actions,
    required this.exerciseCount,
    required this.repCount,
    super.key,
  });

  /// the user actions shows up on the right side of the container
  final List<Widget> actions;

  /// Count of exercise of workout program
  final String exerciseCount;

  /// Rep count of workout program
  final String repCount;

  @override
  Widget build(BuildContext context) {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Leg Curl',
                style: TextStyle(fontSize: 22, fontFamily: 'RobotoBlack'),
              ),
              Text(
                '14 different exercise',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '32 Reps',
                style: TextStyle(
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
