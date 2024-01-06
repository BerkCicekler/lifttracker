// ignore_for_file: public_member_api_docs

extension DateTimeExtension on DateTime {
  /// a control function for detecting if its the giving date equal
  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
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
}
