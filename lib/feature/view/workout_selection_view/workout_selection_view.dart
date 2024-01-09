import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/widgets/workout_program_container.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/model/workout_model.dart';

@RoutePage()
final class WorkoutSelectionView extends StatelessWidget {
  const WorkoutSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = CacheManager.getAllWorkoutModels();
    return Scaffold(
      appBar: AppBar(
        title: Text('workoutSelectionView.selectWorkout'.tr()),
      ),
      body: Center(
        child: FutureBuilder(
          future: list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _WorkoutsColumn(
                workoutModels: snapshot.data!,
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}

final class _WorkoutsColumn extends StatelessWidget {
  const _WorkoutsColumn({required this.workoutModels});

  final Map<int, WorkoutModel> workoutModels;

  @override
  Widget build(BuildContext context) {
    final columnWidgets = <Widget>[];
    for (final i in workoutModels.keys) {
      columnWidgets
        ..add(
          const SizedBox(
            height: 8,
          ),
        )
        ..add(
          CustomWorkoutProgramContainer(
            actions: [
              IconButton(
                onPressed: () {
                  context.popRoute(workoutModels[i]);
                },
                icon: const Icon(
                  Icons.add,
                  color: ColorConstants.lightGreen,
                ),
              ),
            ],
            workoutModel: workoutModels[i]!,
          ),
        );
    }

    return Column(
      children: columnWidgets,
    );
  }
}
