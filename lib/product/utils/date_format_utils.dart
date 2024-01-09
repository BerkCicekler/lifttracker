import 'package:easy_localization/easy_localization.dart';
import 'package:lifttracker/product/extensions/date_time_extension.dart';

/// A class for generating dates as formatted values
final class DateFormatterUtil {
  DateFormatterUtil._();

  /// This function specially generated for
  /// storing Training in the hive box's keys
  /// this function will return the box's key value
  /// depends on the date
  static int trainingHiveBoxDateKey(DateTime date) {
    final format = DateFormat('ddMMy');
    return int.parse(format.format(date));
  }

  /// this function specially generated for
  /// detecting if it the date today, yesterday or a week ago
  /// if the the [date] equal to these function will return as the text.
  /// else if will return the date with a month's name
  static String generateDateTextCalender(DateTime date) {
    final dayName = DateFormat(', EEEE').format(date);
    if (date.isToday()) {
      return 'general.today'.tr() + dayName;
    } else if (date.isYesterday()) {
      return 'general.yesterday'.tr() + dayName;
    } else if (date.isTomorrow()) {
      return 'general.tomorrow'.tr() + dayName;
    } else {
      return DateFormat('EEEE, d MMM').format(date);
    }
  }

  static String generateDateTextWorkoutTile(DateTime date) {
    if (date.isToday()) {
      return 'general.today'.tr();
    } else if (date.isYesterday()) {
      return 'general.yesterday'.tr();
    } else if (date.isTomorrow()) {
      return 'general.tomorrow'.tr();
    } else {
      return DateFormat('d MMM').format(date);
    }
  }

  /// this function is specially created for
  /// converting training's key value in hive box
  /// to DateTime object
  /// basically the reverse function of [trainingHiveBoxDateKey]
  static DateTime intToDateTime(int date) {
    final dateString = date.toString();
    final day = dateString.substring(0, 2);
    final month = dateString.substring(2, 4);
    final year = dateString.substring(4);
    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }
}
