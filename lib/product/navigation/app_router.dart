import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/view/all_trainings/all_trainings_view.dart';
import 'package:lifttracker/feature/view/settings/settings_view.dart';
import 'package:lifttracker/feature/view/calendar/calendar_view.dart';
import 'package:lifttracker/feature/view/dashboard/dashboard_view.dart';
import 'package:lifttracker/feature/view/home/home_view.dart';
import 'package:lifttracker/feature/view/workout_program_editor_view/workout_program_editor_view.dart';
import 'package:lifttracker/feature/view/workout_programs/workout_programs_view.dart';
import 'package:lifttracker/feature/view/workout_selection_view/workout_selection_view.dart';
import 'package:lifttracker/product/model/workout_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// App router class builder for navigation system
final class AppRouter extends _$AppRouter {
  /// replaceInRouteName arg's value for @AutoRouterConfig
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashBoardRoute.page,
          path: '/',
          children: [
            AutoRoute(page: CalendarRoute.page, path: 'calendar'),
            AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
            AutoRoute(page: WorkoutProgramsRoute.page, path: 'workoutPrograms'),
          ],
        ),
        AutoRoute(page: WorkoutProgramEditorRoute.page),
        AutoRoute(page: WorkoutSelectionRoute.page),
        AutoRoute(page: AllTrainingsRoute.page),
      ];
}
