import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/view/calendar/calendar_mixin.dart';
import 'package:lifttracker/feature/view/calendar/widgets/calendar_widget/calendar_table_mixin.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:table_calendar/table_calendar.dart';

part 'widgets/calendar_widget/calendar_table_view.dart';

/// Home screen class
@RoutePage()
final class CalendarView extends StatefulWidget {
  /// Home screen constructor
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

final class _CalendarViewState extends State<CalendarView>
    with CalendarViewOperation {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CalendarTableView(),
        ],
      ),
    );
  }
}
