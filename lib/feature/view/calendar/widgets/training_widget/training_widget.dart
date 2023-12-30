part of '../../calendar_view.dart';

/// Training show widget for calender page
final class TrainingWidget extends StatelessWidget {
  /// [selectedDate] should be the selected date on the calendar
  const TrainingWidget({
    required this.selectedDate,
    super.key,
  });

  /// selected date on the calender table
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
            left: 12,
          ),
          child: Text(
            DateFormat('EEEE, d MMM').format(selectedDate),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        IntractableContainer(
          onTap: () =>
              context.read<CalenderViewCubit>().selectWorkoutModel(context),
        ),
      ],
    );
  }
}
