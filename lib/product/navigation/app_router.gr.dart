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
  };
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
    required int workoutId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WorkoutProgramEditorRoute.name,
          args: WorkoutProgramEditorRouteArgs(
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
    required this.workoutId,
    this.key,
  });

  final int workoutId;

  final Key? key;

  @override
  String toString() {
    return 'WorkoutProgramEditorRouteArgs{workoutId: $workoutId, key: $key}';
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
