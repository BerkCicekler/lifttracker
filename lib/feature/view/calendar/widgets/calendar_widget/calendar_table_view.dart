part of '../../calendar_view.dart';

/// Table Calender widget for Calender view page
final class CalendarTableView extends StatefulWidget {
  /// base contractor
  const CalendarTableView({super.key});

  @override
  State<CalendarTableView> createState() => _CalendarTableViewState();
}

class _CalendarTableViewState extends State<CalendarTableView>
    with CalendarTableViewOperation {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 395,
      child: TableCalendar(
        calendarStyle: const CalendarStyle(
          markerDecoration: BoxDecoration(
            color: ColorConstants.lightGreen,
            shape: BoxShape.circle,
          ),
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
        eventLoader: eventLoader,
      ),
    );
  }
}
