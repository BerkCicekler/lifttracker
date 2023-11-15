import 'package:auto_route/auto_route.dart';
import 'package:lifttracker/feature/calendar/calendar_view.dart';
import 'package:lifttracker/feature/dashboard/dashboard_view.dart';
import 'package:lifttracker/feature/home/home_view.dart';
import 'package:lifttracker/feature/settings/settings_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")

/// App router class builder for navigation system
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashBoardRoute.page,
          path: '/',
          children: [
            AutoRoute(page: CalendarRoute.page, path: 'calendar'),
            AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
            AutoRoute(page: SettingsRoute.page, path: 'settings'),
          ],
        ),
      ];
}
