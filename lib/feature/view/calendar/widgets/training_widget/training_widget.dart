part of '../../calendar_view.dart';

/// Training show widget for calender page
final class TrainingWidget extends StatelessWidget {
  /// Training show widget for calender page
  /// below the calender
  /// and widget will show the selected date's exercise if an exercise
  /// exist in that date
  /// else it will create a intractable container to select a workout
  const TrainingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderViewCubit, DateTime>(
      builder: (context, date) {
        final pureDate = date.toPureDate();
        return Column(
          children: [
            _SelectedDateText(date: pureDate),
            _TrainingContainerHolder(date: pureDate),
          ],
        );
      },
    );
  }
}

final class _TrainingContainerHolder extends StatelessWidget {
  const _TrainingContainerHolder({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final training = context.read<TrainingsCubit>().state[date];
    return training != null
        ? _TrainingContainer(
            model: training,
          )
        : IntractableContainer(
            onTap: () =>
                context.read<CalenderViewCubit>().selectWorkoutModel(context),
          );
  }
}

final class _SelectedDateText extends StatelessWidget {
  const _SelectedDateText({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        DateFormatterUtil.generateDateTextCalender(date),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
