// ignore_for_file: public_member_api_docs

extension DateTimeExtension on DateTime {
  /// will return a new dateTime object with only
  /// year, month, day parameters of given dateTime
  DateTime toPureDate() {
    return DateTime(year, month, day);
  }

  /// Will return the day amount of this month
  int getDayAmountOfMonth() {
    return DateTime(year, month + 1, 0).day;
  }

  /// This function will return the days of exist in this week
  List<DateTime> getWeekDaysAsDateTime() {
    final startOfWeek = subtract(Duration(days: weekday - 1));

    final weekDays = <DateTime>[];
    for (var i = 0; i < 7; i++) {
      weekDays.add(startOfWeek.add(Duration(days: i)));
    }
    return weekDays;
  }

  /// a control function for detecting if its the giving date equal
  bool isSameDate(DateTime date) {
    return toPureDate() == date.toPureDate();
  }

  bool isYesterday() {
    return isSameDate(DateTime.now().subtract(const Duration(days: 1)));
  }

  bool isAWeekAgo() {
    return isSameDate(DateTime.now().subtract(const Duration(days: 7)));
  }

  bool isToday() {
    return isSameDate(DateTime.now());
  }

  bool isTomorrow() {
    return isSameDate(DateTime.now().subtract(const Duration(days: -1)));
  }
}
