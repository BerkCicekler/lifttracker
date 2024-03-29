// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllTrainingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllTrainingsView(),
      );
    },
    CalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CalendarView(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    WorkoutProgramEditorRoute.name: (routeData) {
      final args = routeData.argsAs<WorkoutProgramEditorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorkoutProgramEditorView(
          workoutModel: args.workoutModel,
          workoutId: args.workoutId,
          key: args.key,
        ),
      );
    },
    WorkoutProgramsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkoutProgramsView(),
      );
    },
    WorkoutSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkoutSelectionView(),
      );
    },
  };
}

/// generated route for
/// [AllTrainingsView]
class AllTrainingsRoute extends PageRouteInfo<void> {
  const AllTrainingsRoute({List<PageRouteInfo>? children})
      : super(
          AllTrainingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTrainingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CalendarView]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardView]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkoutProgramEditorView]
class WorkoutProgramEditorRoute
    extends PageRouteInfo<WorkoutProgramEditorRouteArgs> {
  WorkoutProgramEditorRoute({
    required WorkoutModel workoutModel,
    required int workoutId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WorkoutProgramEditorRoute.name,
          args: WorkoutProgramEditorRouteArgs(
            workoutModel: workoutModel,
            workoutId: workoutId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkoutProgramEditorRoute';

  static const PageInfo<WorkoutProgramEditorRouteArgs> page =
      PageInfo<WorkoutProgramEditorRouteArgs>(name);
}

class WorkoutProgramEditorRouteArgs {
  const WorkoutProgramEditorRouteArgs({
    required this.workoutModel,
    required this.workoutId,
    this.key,
  });

  final WorkoutModel workoutModel;

  final int workoutId;

  final Key? key;

  @override
  String toString() {
    return 'WorkoutProgramEditorRouteArgs{workoutModel: $workoutModel, workoutId: $workoutId, key: $key}';
  }
}

/// generated route for
/// [WorkoutProgramsView]
class WorkoutProgramsRoute extends PageRouteInfo<void> {
  const WorkoutProgramsRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutProgramsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutProgramsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkoutSelectionView]
class WorkoutSelectionRoute extends PageRouteInfo<void> {
  const WorkoutSelectionRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
