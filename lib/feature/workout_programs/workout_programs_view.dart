import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/workout_programs/workout_programs_mixin.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// Home screen class
@RoutePage()
class WorkoutProgramsView extends StatefulWidget {
  /// Home screen constructor
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
      child: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
        ),
      ),
    );
  }
}
