import 'package:flutter/cupertino.dart';
import 'package:lifttracker/feature/view/calendar/calendar_view.dart';
import 'package:lifttracker/product/extensions/datetime_extension.dart';
import 'package:widgets/custom_date_picker/custom_date_picker.dart';

mixin CalendarTableViewOperation on State<CalendarTableView> {
  /// default selected date time
  DateTime selectedDate = DateTime.now();

  /// default focused date time
  DateTime focusedDate = DateTime.now();

  /// method will run every time user select a new day from calender
  void onDaySelected(DateTime selectedDay, DateTime focusedDate) {
    selectedDate = selectedDay;
    this.focusedDate = focusedDate;
    setState(() {});
  }

  /// this method will run when user click header of calendar
  /// and cupertino date picker will show up
  void onCalendarHeaderTap(DateTime val) {
    CustomDatePicker.show(
      context: context,
      dateTimeChange: onDatePickerDateTimeChange,
      maximumDate: DateTime(DateTime.now().year + 1),
      minimumDate: DateTime(2020),
      datePickerMode: CupertinoDatePickerMode.monthYear,
    );
  }

  /// method will run every time user select a new date from date picker
  void onDatePickerDateTimeChange(DateTime value) {
    selectedDate = value;
    focusedDate = value;
    setState(() {});
  }

  List<dynamic> eventLoader(DateTime day) {
    return day.isSameDate(DateTime.now()) ? ["sads", "asdasd"] : [];
  }
}
