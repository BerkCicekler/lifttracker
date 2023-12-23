import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/view/calendar/calendar_mixin.dart';
import 'package:table_calendar/table_calendar.dart';

/// Home screen class
@RoutePage()
final class CalendarView extends StatefulWidget {
  /// Home screen constructor
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

final class _CalendarViewState extends State<CalendarView> with CalendarMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // ignore: inference_failure_on_instance_creation
          TableCalendar(
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(122, 220, 251, 19),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Color.fromARGB(166, 220, 251, 19),
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            pageJumpingEnabled: true,
            selectedDayPredicate: (day) => isSameDay(day, selectedDate),
            onDaySelected: onDaySelected,
            focusedDay: focusedDate,
            onHeaderTapped: onCalendarHeaderTap,
            firstDay: DateTime(2020),
            lastDay: DateTime(DateTime.now().year + 1),
          ),
        ],
      ),
    );
  }
}
