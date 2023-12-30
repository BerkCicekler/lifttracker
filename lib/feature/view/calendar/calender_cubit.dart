import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/navigation/app_router.dart';

class CalenderViewCubit extends Cubit<DateTime> {
  CalenderViewCubit(DateTime date) : super(date);

  void dateSelected(DateTime newDate) {
    print(newDate);
    emit(newDate);
  }

  void selectWorkoutModel(BuildContext context) async {
    final model = await context.router.push(
      const WorkoutSelectionRoute(),
    );
    if (model != null) {
      emit(DateTime.now());
    }
  }
}