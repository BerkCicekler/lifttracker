import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom cupertino date picker
final class CustomDatePicker extends StatelessWidget {
  /// Custom created cupertino styled date time picker
  /// [dateTimeChange] an
  const CustomDatePicker({
    required this.dateTimeChange,
    required this.maximumDate,
    required this.minimumDate,
    required this.datePickerMode,
    super.key,
  });

  /// method that will run every time user change date
  final void Function(DateTime)? dateTimeChange;

  /// maximum selectable date
  final DateTime maximumDate;

  /// minimum selectable date
  final DateTime minimumDate;

  /// cupertino date picker's date mode
  final CupertinoDatePickerMode datePickerMode;

  /// this method will show up the CustomDatePicker automatic
  /// [context] BuildContext
  /// [dateTimeChange] a method every time execute every time user change the date value
  /// [maximumDate] maximum selectable date user can access
  /// [minimumDate] minimum selectable date user can access
  /// [datePickerMode] Date Picker mode for cupertino date time widget
  static Future<void> show({
    required BuildContext context,
    required void Function(DateTime)? dateTimeChange,
    required DateTime maximumDate,
    required DateTime minimumDate,
    required CupertinoDatePickerMode datePickerMode,
  }) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CustomDatePicker(
          dateTimeChange: dateTimeChange,
          maximumDate: maximumDate,
          minimumDate: minimumDate,
          datePickerMode: datePickerMode,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(137, 43, 43, 43),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: size.height * 0.3,
      width: size.width,
      child: CupertinoDatePicker(
        mode: datePickerMode,
        onDateTimeChanged: dateTimeChange ?? (val) {},
        minimumDate: minimumDate,
        maximumDate: maximumDate,
      ),
    );
  }
}
