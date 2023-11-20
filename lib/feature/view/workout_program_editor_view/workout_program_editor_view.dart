import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';
import 'package:lifttracker/product/model/workout_model.dart';

@RoutePage()
class WorkoutProgramEditorView extends StatelessWidget {
  /// its a workout program editor page for
  /// managing exercises
  /// [workoutModel] model that will be listed
  /// [workoutId] cache box index of the workout program
  /// on save action will be save the model on this index in cache
  const WorkoutProgramEditorView({
    required this.workoutModel,
    required this.workoutId,
    super.key,
  });

  /// the workout id index saved in cache
  final int workoutId;

  /// workout model that will be show
  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutModel.workoutName),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: const Center(
          child: Column(
            children: [Text('hi')],
          ),
        ),
      ),
    );
  }
}
