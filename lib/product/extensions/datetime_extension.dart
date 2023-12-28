/// General date time extension
extension DateTimeExtension on DateTime {
  /// a control function for detecting if its the giving date equal
  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
