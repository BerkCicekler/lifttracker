import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/app_bar_titles.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/navigation/app_router.dart';

@RoutePage()

/// main views navigation system maintain in  here
final class DashBoardView extends StatelessWidget {
  /// DashBoard View is giving the feature of navigation capability
  /// with the power of autoroute library
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            AppbarTitles.appBarTitles[tabsRouter.activeIndex].tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
      routes: const [CalendarRoute(), HomeRoute(), WorkoutProgramsRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF272c30),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: ColorConstants.lightGreen,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              activeIcon: Icon(Icons.list_alt),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
