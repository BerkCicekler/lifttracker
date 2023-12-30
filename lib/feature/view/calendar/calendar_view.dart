import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/view/calendar/calender_cubit.dart';
import 'package:lifttracker/feature/view/calendar/widgets/calendar_widget/calendar_table_mixin.dart';
import 'package:lifttracker/feature/widgets/intractable_container.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/font_constants.dart';
import 'package:table_calendar/table_calendar.dart';

part 'widgets/calendar_widget/calendar_table_view.dart';
part 'widgets/training_widget/training_widget.dart';

/// Home screen class
@RoutePage()
final class CalendarView extends StatelessWidget {
  /// Home screen constructor
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalenderViewCubit(DateTime.now()),
      child: const _CalenderBody(),
    );
  }
}

class _CalenderBody extends StatelessWidget {
  const _CalenderBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CalendarTableView(),
        BlocBuilder<CalenderViewCubit, DateTime>(
          builder: (context, date) {
            return TrainingWidget(selectedDate: date);
          },
        ),
      ],
    );
  }
}
