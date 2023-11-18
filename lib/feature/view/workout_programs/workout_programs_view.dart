import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/widgets/workout_program_container.dart';
import 'package:lifttracker/feature/view/workout_programs/workout_programs_mixin.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:widgets/text_input_dialog/text_input_dialog.dart';
import 'package:lifttracker/product/constants/color_constants.dart';

part 'widgets/create_workout/create_workout.dart';
part 'widgets/show_delete_icon_buttons/show_delete_icon_buttons.dart';

///
@RoutePage()
class WorkoutProgramsView extends StatefulWidget {
  ///
  const WorkoutProgramsView({super.key});

  @override
  State<WorkoutProgramsView> createState() => _WorkoutProgramsViewState();
}

class _WorkoutProgramsViewState extends State<WorkoutProgramsView>
    with WorkoutProgramOperation {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.page.value),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWorkoutProgramContainer(
              actions: [
                ShowDeleteIconButtonView(
                  workOutId: '1',
                ),
              ],
              exerciseCount: '1',
              repCount: '1',
            ),
            CreateNewWorkout(),
          ],
        ),
      ),
    );
  }
}
