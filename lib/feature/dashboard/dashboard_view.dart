import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/navigation/app_router.dart';

@RoutePage()

/// main views navigation system maintain in  here
class DashBoardView extends StatelessWidget {
  /// DashBoard View is giving the feature of navigation capability
  /// with the power of autoroute library
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: Text(tabsRouter.activeIndex.toString()),
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
          selectedItemColor: const Color(0xFFdefb13),
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
