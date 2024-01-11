import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/cubit/trainings_cubit.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';
import 'package:lifttracker/product/model/training_done_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';
import 'package:lifttracker/product/navigation/app_router.dart';

final class CalenderViewCubit extends Cubit<DateTime> {
  CalenderViewCubit(DateTime date) : super(date);

  void dateSelected(DateTime newDate) {
    emit(newDate);
  }

  void selectWorkoutModel(BuildContext context) async {
    final selection = await context.router.push(
      const WorkoutSelectionRoute(),
    );
    if (selection != null) {
      final model = TrainingModel(
        name: (selection as WorkoutModel).workoutName,
        model: selection,
        training: null,
        note: '',
        date: DateTime(state.year, state.month, state.day),
      );
      context.read<TrainingsCubit>().addNewTrainingToState(model.date, model);
      await CacheManager.saveTraining(
        model: model,
      );
    }
  }
}
