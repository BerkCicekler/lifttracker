import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomYearAndMonthSelector extends StatelessWidget {
  const CustomYearAndMonthSelector({super.key});

  static show({required BuildContext context}) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CustomYearAndMonthSelector();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: size.height * 0.27,
      width: size.width,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.monthYear,
        onDateTimeChanged: (value) {},
      ),
    );
  }
}
