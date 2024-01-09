import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/cubit/trainings_cubit.dart';
import 'package:lifttracker/feature/view/calendar/calendar_view.dart';
import 'package:lifttracker/feature/view/calendar/calender_cubit.dart';
import 'package:widgets/custom_date_picker/custom_date_picker.dart';

/// a operation mixin for Calender table widget
mixin CalendarTableViewOperation on State<CalendarTableView> {
  /// default selected date time
  DateTime selectedDate = DateTime.now();

  /// default focused date time
  DateTime focusedDate = DateTime.now();

  /// will contain the cubit from app level
  late final TrainingsCubit trainingsCubit;

  @override
  void initState() {
    super.initState();
    trainingsCubit = context.read<TrainingsCubit>();
  }

  /// method will run every time user select a new day from calender
  void onDaySelected(DateTime selectedDay, DateTime focusedDate) {
    selectedDate = selectedDay;
    this.focusedDate = focusedDate;
    context.read<CalenderViewCubit>().dateSelected(focusedDate);
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
    final pureDate = DateTime(day.year, day.month, day.day);
    return trainingsCubit.state[pureDate] != null ? ['yes'] : [];
  }
}
