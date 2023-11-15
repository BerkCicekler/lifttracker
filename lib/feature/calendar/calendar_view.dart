import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Home screen class
@RoutePage()
class CalendarView extends StatefulWidget {
  /// Home screen constructer
  CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedDate = DateTime.now();

  DateTime _focusedDate = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDate) {
    print(focusedDate);
    print(selectedDay);
    _selectedDate = selectedDay;
    _focusedDate = focusedDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Center(
      child: Column(
        children: [
          TableCalendar(
            headerStyle:
                HeaderStyle(titleCentered: true, formatButtonVisible: false),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
            onDaySelected: _onDaySelected,
            focusedDay: _focusedDate,
            firstDay: DateTime(2020),
            lastDay: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
