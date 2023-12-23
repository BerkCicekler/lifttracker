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
          title: Text(AppbarTitles.appBarTitles[tabsRouter.activeIndex].tr()),
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                tabsRouter.activeIndex == 0
                    ? Icons.calendar_month
                    : Icons.calendar_month_outlined,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                tabsRouter.activeIndex == 1 ? Icons.home : Icons.home_outlined,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                tabsRouter.activeIndex == 2
                    ? Icons.list_alt
                    : Icons.list_alt_outlined,
              ),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
