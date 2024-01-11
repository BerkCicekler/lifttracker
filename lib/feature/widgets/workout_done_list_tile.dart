import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/model/training_done_model.dart';
import 'package:lifttracker/product/utils/date_format_utils.dart';

final class WorkoutDoneListTile extends StatelessWidget {
  const WorkoutDoneListTile({
    required this.trainingModel,
    this.isOdd,
    this.backgroundColor,
    super.key,
  });

  final TrainingModel trainingModel;

  final bool? isOdd;

  final Color? backgroundColor;

  final oddackgroundColor = const Color.fromARGB(51, 158, 158, 158);

  final evenBackgroundColor = const Color.fromARGB(87, 158, 158, 158);

  void _onTap() {
    ///TODO
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 40,
      titleTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      leadingAndTrailingTextStyle:
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      tileColor: backgroundColor ??
          (isOdd != null
              ? (isOdd! ? oddackgroundColor : evenBackgroundColor)
              : null),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      leading: Text(
        DateFormatterUtil.generateDateTextWorkoutTile(trainingModel.date),
      ),
      title: Text(trainingModel.name),
      trailing: RichText(
        text: TextSpan(
          text: 'general.view'.tr(),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: ColorConstants.lightGreen,
          ),
          recognizer: TapGestureRecognizer()..onTap = _onTap,
        ),
      ),
    );
  }
}
