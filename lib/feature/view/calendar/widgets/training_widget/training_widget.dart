part of '../../calendar_view.dart';

/// Training show widget for calender page
final class TrainingWidget extends StatelessWidget {
  const TrainingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderViewCubit, DateTime>(
      builder: (context, date) {
        return Column(
          children: [
            _SelectedDateText(date: date),
            IntractableContainer(
              onTap: () =>
                  context.read<CalenderViewCubit>().selectWorkoutModel(context),
            ),
          ],
        );
      },
    );
  }
}

final class _SelectedDateText extends StatelessWidget {
  const _SelectedDateText({required this.date});

  final DateTime date;

  String _generateDateText() {
    if (date.isToday()) {
      return 'Today';
    } else if (date.isYesterday()) {
      return 'Yesterday';
    } else if (date.isAWeekAgo()) {
      return 'Week ago';
    } else {
      return DateFormat('EEEE, d MMM').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        _generateDateText(),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
